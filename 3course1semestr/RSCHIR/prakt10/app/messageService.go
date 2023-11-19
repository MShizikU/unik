package main

import (
    "log"
    "net"
    "os"
    "io"
    "github.com/joho/godotenv"
    "golang.org/x/net/context"
    "google.golang.org/grpc"
    pb "grpcgateaway/server/pb/message"
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
    messagePort := os.Getenv("MESSAGE_PORT")

    logFile, err := os.OpenFile(logFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("Failed to open log file: %s", err)
	}
	defer logFile.Close()

	logger = log.New(io.MultiWriter(os.Stdout, logFile), "", log.LstdFlags)
	
    lis, err := net.Listen("tcp", ":" + messagePort)
    if err != nil {
        logger.Fatalf("Failed to listen: %v", err)
    }

    opts := []grpc.ServerOption{}
    grpcServer := grpc.NewServer(opts...)
    pb.RegisterMessageServiceServer(grpcServer, &server{})

    logger.Println("Message Service is running...")

    if err := grpcServer.Serve(lis); err != nil {
        logger.Fatalf("Failed to serve: %v", err)
    }
}

type server struct {
    pb.UnimplementedMessageServiceServer
}

func (s *server) ReverseMessage(ctx context.Context, req *pb.ReverseMessageRequest) (*pb.ReverseMessageResponse, error) {
    response := pb.ReverseMessageResponse{
        ReversedMessage: reverseString(req.Message),
    }

    return &response, nil
}


func reverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}
