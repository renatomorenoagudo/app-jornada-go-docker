FROM golang:1.22.5-alpine as builder

#diretorio de trabalho:
WORKDIR /app 

COPY go.mod go.sum ./

RUN go mod download && go mod verify

#build: copia tudo para o app:
COPY . .

RUN go build -o /bin/journey ./cmd/journey/journey.go

#imagem que não tem tag, mais enxuta:
FROM scratch

WORKDIR /app

COPY --from=builder /bin/journey .

EXPOSE 8080

ENTRYPOINT ["./journey"]