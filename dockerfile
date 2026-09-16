FROM golang:1.27.1-alpine3.24 AS builder
WORKDIR /app
COPY main.go .
RUN go build -o app main.go

FROM alpine:3.24
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 32777
CMD ["./app"]