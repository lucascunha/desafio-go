# 1st stage - the building
FROM golang:1.8 as build-stage
WORKDIR /app
COPY app.go .
RUN go build -o hello-code .

# 2nd stage - copiyng the binary
FROM alpine:latest

COPY --from=build-stage /app/hello-code /bin

CMD hello-code
