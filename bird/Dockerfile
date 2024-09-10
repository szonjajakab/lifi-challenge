FROM golang:1.22.5-alpine AS builder
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY . .
RUN go build -o getBird -ldflags="-s -w" .

FROM alpine:latest
ENV GOBIN /usr/local/bin
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/getBird /usr/local/bin/getBird

EXPOSE 4201

ENTRYPOINT ["/usr/local/bin/getBird"]
