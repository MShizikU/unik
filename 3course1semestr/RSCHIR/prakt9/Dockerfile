FROM golang:latest

WORKDIR /app


COPY . .

RUN mkdir logs

RUN touch logs/application.log

RUN go mod init test
RUN go clean -modcache
RUN go mod tidy


RUN go build -o main .

CMD ["./main"]