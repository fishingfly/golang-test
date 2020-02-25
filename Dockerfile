#FROM golang:latest as builder
#LABEL maintainer="zhounanjun <zhouyu@cmss.chinamobile.com>"
#WORKDIR /app
#COPY go.mod go.sum ./
#RUN go env -w GO111MODULE=on #解决国内 go get 无法下载的问题
#RUN go env -w GOPROXY=https://goproxy.cn,direct #解决国内 go get 无法下载的问题
#RUN go mod download
#COPY . .
# Build the Go app
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
######## Start a new stage from scratch #######
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
# Copy the Pre-built binary file from the previous stage
COPY main .
# Expose port 8080 to the outside world
EXPOSE 8888
# Command to run the executable
CMD ["./main"]
