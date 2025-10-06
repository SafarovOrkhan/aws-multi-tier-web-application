package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)

type SimpleMessage struct {
	Message string `json:"message"`
}

type TodaysDate struct {
	Time time.Time `json:"date"`
}

type ErrorReturn struct {
	Message    string `json:"message"`
	StatusCode int    `json:"statusCode"`
}

func basicInfo(w http.ResponseWriter, r *http.Request) {
	var message SimpleMessage
	w.Header().Set("Content-Type", "application/json")
	message.Message = "this is a simple https server"

	_, err := json.Marshal(message)
	if err != nil {
		var errorResponse ErrorReturn
		errorResponse.Message = err.Error()
		errorResponse.StatusCode = http.StatusInternalServerError

		json.NewEncoder(w).Encode(&errorResponse)
	}

	json.NewEncoder(w).Encode(message)
}

func deliverCurrentDay(w http.ResponseWriter, r *http.Request) {
	var message TodaysDate
	message.Time = time.Now()
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(message)
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/info", basicInfo).Methods("GET")
	r.HandleFunc("/today", deliverCurrentDay).Methods("GET")

	srv := &http.Server{
		Addr:    "localhost:8000",
		Handler: r,
	}
	fmt.Println("Starting http server")
	err := srv.ListenAndServe()
	if err != nil {
		log.Fatal(err)
	}
}
