package main

import (
    "strings"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    w.Write("Hello World.")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":5000", nil)
}
