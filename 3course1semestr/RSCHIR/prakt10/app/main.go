package main

import (
    "log"
    "net/http"
    "context"
    "os"
    "io"
    "github.com/joho/godotenv"
    "github.com/gin-gonic/gin"
    "google.golang.org/grpc"

    pb "grpcgateaway/server/pb/message"
    ub "grpcgateaway/server/pb/user"
)

var (
    logger *log.Logger
)

func main() {

    err := godotenv.Load("local.env")
	if err != nil {
		log.Fatalf("Some error occured. Err: %s", err)
	}

    logFilePath := os.Getenv("LOG_FILE_PATH")
    log.Println(logFilePath)
    mainPort := os.Getenv("MAIN_PORT")
    log.Println(mainPort)
    messagePort := os.Getenv("MESSAGE_PORT")
    log.Println(messagePort)
    userPort := os.Getenv("USER_PORT")
    log.Println(userPort)
    expectedHeader := os.Getenv("EXPECTED_HEADER_NAME")
    log.Println(expectedHeader)
    

    logFile, err := os.OpenFile(logFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("Failed to open log file: %s", err)
	}
	defer logFile.Close()

	logger = log.New(io.MultiWriter(os.Stdout, logFile), "", log.LstdFlags)

    opts := []grpc.DialOption{
        grpc.WithInsecure(),
    }

    messageServiceCon, err := grpc.Dial("message-service:" + messagePort, opts...)
    if err != nil {
        logger.Fatalf("Failed to dial microservice 1: %v", err)
    }
    defer messageServiceCon.Close()

    messageService := pb.NewMessageServiceClient(messageServiceCon)

    userServiceCon, err := grpc.Dial("user-service:" + userPort, opts...)
    if err != nil {
        logger.Fatalf("Failed to dial microservice 1: %v", err)
    }
    defer userServiceCon.Close()

    userService := ub.NewUserServiceClient(userServiceCon)

    router := gin.Default()

    router.POST("/api", func(c *gin.Context) {
        requestedService := c.Request.Header.Get(expectedHeader)
        switch requestedService {
        case "messageService":
            var requestData pb.ReverseMessageRequest
            if err := c.BindJSON(&requestData); err != nil {
                c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
                return
            }
            var responseData pb.ReverseMessageResponse
            response, err := messageService.ReverseMessage(context.Background(), &requestData)
            if err != nil {
                c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
                return
            }
            responseData = *response
            c.JSON(http.StatusOK, responseData)
        
        case "userService":
            var requestData ub.UserMessageRequest
            if err := c.BindJSON(&requestData); err != nil {
                c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
                return
            }
            var responseData ub.UserMessageResponse
            response, err := userService.UserSend(context.Background(), &requestData)
            if err != nil {
                c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
                return
            }
            responseData = *response
            c.JSON(http.StatusOK, responseData)
        }
    })
    if err := router.Run(":"+mainPort); err != nil {
        logger.Fatalf("Failed to start API Gateway: %v", err)
    }
}