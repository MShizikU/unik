FROM golang:latest

WORKDIR /app

COPY . .

RUN mkdir logs



RUN touch logs/application.log

RUN go get github.com/joho/godotenv
RUN go get github.com/gorilla/mux
RUN go get github.com/gorilla/securecookie

RUN go mod download

RUN go build -o main .

CMD ["./main"]