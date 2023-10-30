package main

import (
    "fmt"
	"log"
    "io"
    "net/http"
	"os"

	"github.com/joho/godotenv"
    "github.com/spf13/viper"
    "github.com/gorilla/mux"
    "go.mongodb.org/mongo-driver/mongo"
    "go.mongodb.org/mongo-driver/mongo/gridfs"
    "go.mongodb.org/mongo-driver/mongo/options"
)

var (
	mongoURI string
    dbClient   *mongo.Client
    fs         *gridfs.Bucket
    collection *mongo.Collection
)

func main() {
	godotenv.Load()
	mongoURI = os.Getenv("MONGODB_URI")
	fmt.Println(mongoURI)

    loadConfig()
    connectDB()
    initGridFS()

    router := mux.NewRouter()
    router.HandleFunc("/api/upload", UploadFile)
    err := http.ListenAndServe(":8080", router)
    if err != nil {
        fmt.Println(err)
    }
}

func loadConfig() {
    viper.SetConfigFile(".env")
    viper.ReadInConfig()
    viper.AutomaticEnv()
}

func connectDB() {
    
    clientOptions := options.Client().ApplyURI(mongoURI)
    client, err := mongo.Connect(nil, clientOptions)
    if err != nil {
        log.Fatal(err)
    }

    dbClient = client
    collection = client.Database("files_db").Collection("files")
}

func initGridFS() {
    db := dbClient.Database("files_db")
    fsTemp, err := gridfs.NewBucket(db)
    if err != nil {
        log.Fatal(err)
    }

	fs = fsTemp
}

func UploadFile(response http.ResponseWriter, request *http.Request) {
    request.ParseMultipartForm(10 * 1024 * 1024)

    file, handler, err := request.FormFile("file")
    if err != nil {
        fmt.Println(err)
        return
    }
    defer file.Close()

    name := handler.Filename

    uploadStream, err := fs.OpenUploadStream(name)
    if err != nil {
        fmt.Println(err)
        return
    }
    defer uploadStream.Close()

    _, err = io.Copy(uploadStream, file)
    if err != nil {
        fmt.Println(err)
        return
    }
}