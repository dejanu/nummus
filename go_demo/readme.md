


### Start app

* app `main.go`` a simple web app, you can start it `go run main.go` and test it `curl localhost:3333/hello`


### Build app

* Create module `go mod init example.com/demo`

* Build and run image `docker run -p 3000:3333 dejanualex/demo:v1.0`