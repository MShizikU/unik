package main

import (
    "log"
    "net"
    "os"
    "io"
    "github.com/joho/godotenv"
    "golang.org/x/net/context"
    "google.golang.org/grpc"
    pb "grpcgateaway/server/pb/user"
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
    userPort := os.Getenv("USER_PORT")

    logFile, err := os.OpenFile(logFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("Failed to open log file: %s", err)
	}
	defer logFile.Close()

	logger = log.New(io.MultiWriter(os.Stdout, logFile), "", log.LstdFlags)
	
    lis, err := net.Listen("tcp", ":" + userPort)
    if err != nil {
        logger.Fatalf("Failed to listen: %v", err)
    }

    opts := []grpc.ServerOption{}
    grpcServer := grpc.NewServer(opts...)
    pb.RegisterUserServiceServer(grpcServer, &server{})

    logger.Println("Message Service is running...")

    if err := grpcServer.Serve(lis); err != nil {
        logger.Fatalf("Failed to serve: %v", err)
    }
}

type server struct {
    pb.UnimplementedUserServiceServer
}

func (s *server) UserSend(ctx context.Context, req *pb.UserMessageRequest) (*pb.UserMessageResponse, error) {
    response := pb.UserMessageResponse{
        Message: req.Message,
    }

    return &response, nil
}