package main

import (
	"fmt"
	"io"
	"net/http"
)

func getRoot(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("got /hello request\n")
	io.WriteString(w, "<p><hr><center><b>HELLO DEMO</b></center></p>")
}

func getHello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<p><hr><center>GO <b>WHALE </b>🐳</center></p>")
}

func main() {
	http.HandleFunc("/", getRoot)
	http.HandleFunc("/hello", getHello)
	http.ListenAndServe(":3333", nil)
}
