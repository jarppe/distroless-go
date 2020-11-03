package main

import (
	"net/http"
)

func main() {
	content := []byte("<h1>Hello</h1>")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Header().Set("Content-Type", "test/html; charset=utf8")
		w.Write(content)
	})

	http.ListenAndServe(":8080", nil)
}
