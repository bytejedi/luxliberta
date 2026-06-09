# Makefile for luxliberta

BINARY_NAME=luxliberta
GIT_COMMIT=$(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")
BUILD_TIME=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

LDFLAGS=-ldflags "-s -w -X main.gitCommit=${GIT_COMMIT} -X main.buildTime=${BUILD_TIME}"

.PHONY: all build test clean

all: build

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -o ${BINARY_NAME}

test:
	go test -v ./...

clean:
	rm -f ${BINARY_NAME}
