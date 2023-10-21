package main

import (
	"encoding/json"
	"io"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/gorilla/mux"
	"github.com/gorilla/securecookie"
)

var (
	cookieName   string
	cookieValue  string
	logFilePath  string
	cookieHandler *securecookie.SecureCookie
)

type UserRequest struct {
	Data string `json:"data"`
}

type UserResponse struct {
	Message string `json:"message"`
}

func main() {

	err := godotenv.Load()

	if err != nil {
		log.Fatal("Error loading .env file:", err)
	}

	cookieName = os.Getenv("COOKIE_NAME")
	cookieValue = os.Getenv("COOKIE_VALUE")
	logFilePath = os.Getenv("LOG_FILE_PATH")
	cookieHandler = securecookie.New(
		securecookie.GenerateRandomKey(64),
		securecookie.GenerateRandomKey(32),
	)

	logFile, err := os.OpenFile(logFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("Failed to open log file: %s", err)
	}
	defer logFile.Close()

	// Create a logger for both file and standard output
	logger := log.New(io.MultiWriter(os.Stdout, logFile), "", log.LstdFlags)
	logger.Println(cookieName);

	router := mux.NewRouter()
	router.HandleFunc("/api/linear", linearHandler).Methods("POST")
	router.HandleFunc("/api/concurrent", concurrentHandler).Methods("POST")
	router.HandleFunc("/api/linear", linearDataHandler).Methods("GET")
	router.HandleFunc("/api/concurrent", concurrentDataHandler).Methods("GET")

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	logger.Printf("Server listening on port %s", port)
	logger.Fatal(http.ListenAndServe(":"+port, router))
}

func linearHandler(w http.ResponseWriter, r *http.Request) {
	var request UserRequest
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}

	time.Sleep(2 * time.Second)

	response := UserResponse{
		Message: "Processed linearly",
	}

	// Шифруем данные и сохраняем в cookie
	encoded, err := cookieHandler.Encode(cookieName, response)
	if err != nil {
		http.Error(w, "Failed to encode cookie", http.StatusInternalServerError)
		return
	}
	cookie := &http.Cookie{
		Name:     cookieName,
		Value:    encoded,
		Path:     "/",
		HttpOnly: true,
	}
	http.SetCookie(w, cookie)

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func concurrentHandler(w http.ResponseWriter, r *http.Request) {
	var request UserRequest
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}

	go func() {
		time.Sleep(2 * time.Second)

		response := UserResponse{
			Message: "Processed concurrently",
		}

		encoded, err := cookieHandler.Encode(cookieName, response)
		if err != nil {
			log.Println("Failed to encode cookie:", err)
			return
		}
		cookie := &http.Cookie{
			Name:     cookieName,
			Value:    encoded,
			Path:     "/",
			HttpOnly: true,
		}
		http.SetCookie(w, cookie)

		log.Println("Concurrent processing completed")
	}()

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(UserResponse{
		Message: "Processing concurrently",
	})
}

func linearDataHandler(w http.ResponseWriter, r *http.Request) {
	cookie, err := r.Cookie(cookieName)
	if err != nil {
		http.Error(w, "Cookie not found", http.StatusNotFound)
		return
	}

	var response UserResponse
	err = cookieHandler.Decode(cookieName, cookie.Value, &response)
	if err != nil {
		http.Error(w, "Failed to decode cookie", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func concurrentDataHandler(w http.ResponseWriter, r *http.Request) {
	cookie, err := r.Cookie(cookieName)
	if err != nil {
		http.Error(w, "Cookie not found", http.StatusNotFound)
		return
	}

	var response UserResponse
	err = cookieHandler.Decode(cookieName, cookie.Value, &response)
	if err != nil {
		http.Error(w, "Failed to decode cookie", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func setCookie(w http.ResponseWriter, response UserResponse) error {
	encoded, err := cookieHandler.Encode(cookieName, response)
	if err != nil {
		return err
	}
	cookie := &http.Cookie{
		Name:     cookieName,
		Value:    encoded,
		Path:     "/",
		HttpOnly: true,
	}
	http.SetCookie(w, cookie)

	return nil
}