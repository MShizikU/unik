FROM golang:latest

WORKDIR /app


COPY . .
RUN go mod init test
RUN go clean -modcache
RUN go get go.mongodb.org/mongo-driver@latest
RUN go mod tidy


RUN go build -o main .

CMD ["./main"]