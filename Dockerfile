FROM golang:1.10 as builder
WORKDIR /go/src/github.com/kousik93/harness-blue-green-test

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o bin/harness-blue-green-test . && \
    go test ./... -cover

FROM alpine:3.6
RUN mkdir /opt
RUN apk add --no-cache ca-certificates
WORKDIR /opt/
COPY --from=builder /go/src/github.com/kousik93/harness-blue-green-test/bin/harness-blue-green-test .
ENTRYPOINT ["./harness-blue-green-test"]
