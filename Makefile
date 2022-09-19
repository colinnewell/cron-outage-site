all: build deploy

build: bin/query

bin/query: query/*.go go.*
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/query query/main.go

clean:
	rm -rf ./bin ./vendor

deploy: build
	sls deploy --verbose

.PHONY: deploy


