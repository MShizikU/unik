package main

import (
    "fmt"
	"log"
    "io"
    "net/http"
	"os"
    "time"

	"github.com/joho/godotenv"
    "github.com/gorilla/mux"
    "go.mongodb.org/mongo-driver/bson/primitive"
    "go.mongodb.org/mongo-driver/mongo"
    "go.mongodb.org/mongo-driver/bson"
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

type File struct {
	ID       string    `bson:"_id,omitempty"`
	Name     string    `bson:"name"`
	Size     int64     `bson:"size"`
	AddedAt  time.Time `bson:"added_at"`
}

type gridfsFile struct {
    Name   string `bson:"filename"`
    Length int64  `bson:"length"`
 }

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

    //curl -X POST -F "file=@./testFiles/File1.txt" http://localhost:80/api/upload
	router.HandleFunc("/api/upload", UploadFile).Methods("POST")

    //curl -X GET http://localhost:80/api/files
	router.HandleFunc("/api/files", GetFiles).Methods("GET")

    //curl -X GET http://localhost:80/api/gridfiles
    router.HandleFunc("/api/gridfiles", GetGridFSFiles).Methods("GET")

    //curl -OJ http://localhost:80/api/files/{id}
    router.HandleFunc("/api/files/{id}", GetFileContentById).Methods("GET") 

    //curl -X GET http://localhost:80/api/files/{id}/info
	router.HandleFunc("/api/files/{id}/info", GetFileByID).Methods("GET")

    //curl -X PUT http://localhost:80/api/files/{id}
	router.HandleFunc("/api/files/{id}", UpdateFileByID).Methods("PUT")

    //curl -X DELETE http://localhost:80/api/files/{id}
	router.HandleFunc("/api/files/{id}", DeleteFileByID).Methods("DELETE")

    http.ListenAndServe(":8080", router)

    port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
    
    fmt.Println("Server listening on port %s", port)
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
	size := handler.Size

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

	fileID := uploadStream.FileID.(primitive.ObjectID).Hex()

	fileDoc := File{
		ID:       fileID,
		Name:     name,
		Size:     size,
		AddedAt:  time.Now(),
	}

	_, err = collection.InsertOne(nil, fileDoc)
	if err != nil {
		logger.Println(err)
		return
	}

	response.WriteHeader(http.StatusOK)
	response.Write([]byte("File uploaded successfully"))
}

func GetGridFSFiles(response http.ResponseWriter, request *http.Request) {
    filter := bson.D{{"length", bson.D{{"$gt", 0}}}}
    cursor, err := fs.Find(filter)
    if err != nil {
        logger.Println(err)
    }

    var foundFiles []gridfsFile
    for cursor.Next(nil){
        var result gridfsFile
        if err := cursor.Decode(&result); err != nil {
			logger.Println(err)
			return
		}

        foundFiles = append(foundFiles, result)
    }

    for _, file := range foundFiles {
        logger.Printf("filename: %s, length: %d\n", file.Name, file.Length)
    }
    return
}

func GetFiles(response http.ResponseWriter, request *http.Request) {
	cursor, err := collection.Find(nil, bson.M{})
	if err != nil {
		logger.Println(err)
		return
	}
	defer cursor.Close(nil)

	var files []string
	for cursor.Next(nil) {
		var result File
		if err := cursor.Decode(&result); err != nil {
			logger.Println(err)
			return
		}
		files = append(files, result.ID)
	}

	response.WriteHeader(http.StatusOK)
	response.Write([]byte(fmt.Sprintf("Files: %v", files)))
}

func GetFileContentById(response http.ResponseWriter, request *http.Request) {
    params := mux.Vars(request)
    id := params["id"]

    var file File
    err := collection.FindOne(nil, bson.M{"_id": id}).Decode(&file)
    if err != nil {
        logger.Println(err)
        response.WriteHeader(http.StatusNotFound)
        response.Write([]byte("File not found"))
        return
    }
    
    name := file.Name
    logger.Println("File: " + name)

    downloadStream, err := fs.OpenDownloadStreamByName(name)
    if err != nil {
        logger.Println(err)
        response.WriteHeader(http.StatusInternalServerError)
        response.Write([]byte("Failed to open download stream"))
        return
    }
    defer downloadStream.Close()

    response.Header().Set("Content-Disposition", fmt.Sprintf("attachment; filename=%s", file.Name))
    response.Header().Set("Content-Type", "application/octet-stream")

    _, err = io.Copy(response, downloadStream)
    if err != nil {
        logger.Println(err)
        response.WriteHeader(http.StatusInternalServerError)
        response.Write([]byte("Failed to download file"))
        return
    }
}

func GetFileByID(response http.ResponseWriter, request *http.Request) {
	params := mux.Vars(request)
	id := params["id"]

	var file File
	err := collection.FindOne(nil, bson.M{"_id": id}).Decode(&file)
	if err != nil {
		logger.Println(err)
		response.WriteHeader(http.StatusNotFound)
		response.Write([]byte("File not found"))
		return
	}

	response.WriteHeader(http.StatusOK)
	response.Write([]byte(fmt.Sprintf("File ID: %s, Name: %s, Size: %d, AddedAt: %s", file.ID, file.Name, file.Size, file.AddedAt)))
}

func UpdateFileByID(response http.ResponseWriter, request *http.Request) {
	params := mux.Vars(request)
	id := params["id"]

	var file File
	err := collection.FindOne(nil, bson.M{"_id": id}).Decode(&file)
	if err != nil {
		logger.Println(err)
		response.WriteHeader(http.StatusNotFound)
		response.Write([]byte("File not found"))
		return
	}

	request.ParseMultipartForm(10 * 1024 * 1024)

	uploadedFile, handler, err := request.FormFile("file")
	if err != nil {
		logger.Println(err)
		return
	}
	defer uploadedFile.Close()

	name := file.Name
    size := handler.Size

	uploadStream, err := fs.OpenUploadStream(name)
	if err != nil {
		logger.Println(err)
		return
	}
	defer uploadStream.Close()

	_, err = io.Copy(uploadStream, uploadedFile)
	if err != nil {
		logger.Println(err)
		return
	}

	file.Name = name
	file.Size = size
	file.AddedAt = time.Now()

	_, err = collection.UpdateOne(nil, bson.M{"_id": id}, bson.M{"$set": file})
	if err != nil {
		logger.Println(err)
		return
	}

	response.WriteHeader(http.StatusOK)
	response.Write([]byte("File updated successfully"))
}

func DeleteFileByID(response http.ResponseWriter, request *http.Request) {
	params := mux.Vars(request)
	id := params["id"]

    var file File
	err := collection.FindOne(nil, bson.M{"_id": id}).Decode(&file)
	if err != nil {
		logger.Println(err)
		response.WriteHeader(http.StatusNotFound)
		response.Write([]byte("File not found"))
		return
	}

    _, err = collection.DeleteOne(nil, bson.M{"_id": id})
	if err != nil {
		logger.Println(err)
		response.WriteHeader(http.StatusNotFound)
		response.Write([]byte("File not found"))
		return
	}

    fileID, err := primitive.ObjectIDFromHex(id)

    err = fs.Delete(fileID)
	if err != nil {
		logger.Println(err)
		response.WriteHeader(http.StatusNotFound)
		response.Write([]byte("File not found"))
		return
	}
	response.WriteHeader(http.StatusOK)
	response.Write([]byte("File deleted successfully"))
}