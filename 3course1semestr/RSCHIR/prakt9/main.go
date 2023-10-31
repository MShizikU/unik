package main

import (
    "fmt"
	"log"
    "io"
    "net/http"
	"os"

	"github.com/joho/godotenv"
    "github.com/gorilla/mux"
    "go.mongodb.org/mongo-driver/mongo"
    "go.mongodb.org/mongo-driver/mongo/gridfs"
    "go.mongodb.org/mongo-driver/mongo/options"
)

var (
    logger *log.Logger
	mongoURI string
    logFilePath  string
    dbClient   *mongo.Client
    fs         *gridfs.Bucket
    collection *mongo.Collection
)

func main() {

    err := godotenv.Load("local.env")
	if err != nil {
		log.Fatalf("Some error occured. Err: %s", err)
	}

	mongoURI = os.Getenv("MONGO_URI")
    logFilePath = os.Getenv("LOG_FILE_PATH")

    logFile, err := os.OpenFile(logFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("Failed to open log file: %s", err)
	}
	defer logFile.Close()

	logger = log.New(io.MultiWriter(os.Stdout, logFile), "", log.LstdFlags)

    connectDB()
    initGridFS()

    router := mux.NewRouter()
    router.HandleFunc("/api/upload", UploadFile)
    http.ListenAndServe(":8080", router)

    port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
    
    logger.Printf("Server listening on port %s", port)
	logger.Fatal(http.ListenAndServe(":"+port, router))
    
}

func connectDB() {
    
    clientOptions := options.Client().ApplyURI(mongoURI)
    client, err := mongo.Connect(nil, clientOptions)
    if err != nil {
        logger.Fatal(err)
    }

    dbClient = client
    collection = client.Database("files_db").Collection("files")
}

func initGridFS() {
    db := dbClient.Database("files_db")
    fsTemp, err := gridfs.NewBucket(db)
    if err != nil {
        logger.Fatal(err)
    }

	fs = fsTemp
}

func UploadFile(response http.ResponseWriter, request *http.Request) {
    request.ParseMultipartForm(10 * 1024 * 1024)

    file, handler, err := request.FormFile("file")
    if err != nil {
        logger.Println(err)
        return
    }
    defer file.Close()

    name := handler.Filename

    uploadStream, err := fs.OpenUploadStream(name)
    if err != nil {
        logger.Println(err)
        return
    }
    defer uploadStream.Close()

    _, err = io.Copy(uploadStream, file)
    if err != nil {
        logger.Println(err)
        return
    }
}