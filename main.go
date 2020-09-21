package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	_ "github.com/lib/pq"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"time"
	"os"
)

type Disc struct {
	DiscId int `json:"discId"`
	Brand string `json:"brand"`
	Name string `json:"name"`
	Plastic string `json:"plastic"`
	Stability string `json:"stability"`
	Speed string `json:"speed"`
	Glide string `json:"glide"`
	Turn string `json:"turn"`
	Fade string `json:"fade"`
	IsInBag bool `json:"isinbag"`
	IsCollected bool `json:"iscollected"`
	IsOwned bool `json:"isowned"`
	Description string `json:"description"`
	Notes string `json:"notes"`
	Link string `json:"link"`
}

type Discs []Disc

// GET /
func indexHandler(w http.ResponseWriter, r *http.Request) {
	setupResponse(&w, r)
	if (*r).Method == "OPTIONS" {
		return
	}
	fmt.Fprint(w, "Homepage Endpoint Hit")
}

// GET /status
func statusHandler(w http.ResponseWriter, r *http.Request) {
	setupResponse(&w, r)
	if (*r).Method == "OPTIONS" {
		return
	}
	json.NewEncoder(w).Encode("200 OK")
}

// GET /discs
func getAllDiscsHandler(w http.ResponseWriter, r *http.Request) {

	setupResponse(&w, r)
	if (*r).Method == "OPTIONS" {
		return
	}
	fmt.Println("("+time.Now().String()+") Endpoint Hit: GET /discs")

	discs := getAllDiscs(getDatabaseConnection())

	json.NewEncoder(w).Encode(discs)
}

//POST /discs
//func postActiveDisc(w http.ResponseWriter, r *http.Request) {
//	setupResponse(&w, r)
//	if (*r).Method == "OPTIONS" {
//		return
//	}
//	fmt.Println("("+time.Now().String()+") Endpoint Hit: POST /discs")
//
//
//	//discs := addNewDisc(getDatabaseConnection())
//	decoder := json.NewDecoder(r.Body)
//	var disc Disc
//	err := decoder.Decode(&disc)
//	if err != nil {
//		panic(err.Error())
//	}
//	if addNewDisc(getDatabaseConnection(), disc.Description) {
//		json.NewEncoder(w).Encode("Disc with description " + disc.Description + " was successfully added.")
//	}
//}
//
//PUT /discs
//func updateActiveDisc(w http.ResponseWriter, r *http.Request) {
//	setupResponse(&w, r)
//	if (*r).Method == "OPTIONS" {
//		return
//	}
//	fmt.Println("("+time.Now().String()+") Endpoint Hit: PUT /discs")
//
//	decoder := json.NewDecoder(r.Body)
//	var disc Disc
//	err := decoder.Decode(&disc)
//	if err != nil {
//		panic(err.Error())
//	}
//	if updateDisc(getDatabaseConnection(), disc) {
//		json.NewEncoder(w).Encode("Disc with ID " + string(disc.DiscId) + " was successfully completed.")
//	}
//}
//
//DELETE /discs
//func deleteDisc(w http.ResponseWriter, r *http.Request) {
//	setupResponse(&w, r)
//	if (*r).Method == "OPTIONS" {
//		return
//	}
//	fmt.Println("("+time.Now().String()+") Endpoint Hit: DELETE /discs")
//
//	discId, ok := r.URL.Query()["discId"]
//	if !ok || len(discId[0]) < 1 {
//		panic("Url request parameter 'discId' is required for disc deletion.")
//	}
//	if deleteCompletedDisc(getDatabaseConnection(), discId[0]) {
//		json.NewEncoder(w).Encode("Disc with ID " + discId[0] + " was successfully deleted.")
//	}
//}

// Database Utilities
func addNewDisc(db *sql.DB, description string) bool  {
	discSql := `INSERT INTO disc_catalog.disc(
                              discId, 
                              brand, 
                              name, 
                              plastic, 
                              stability, 
                              speed, 
                              glide, 
                              turn, 
                              fade, 
                              isinbag, 
                              iscollected, 
                              isowned, 
                              description, 
                              notes, 
                              link) 
    			VALUES(default, $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15);`

	var now = time.Now()
	var discDate = fmt.Sprintf("%v %v %v", now.Month().String(), now.Day(), now.Year())
	results, err := db.Query(discSql, description, discDate)
	if err != nil {
		panic(err.Error())
	}
	defer results.Close()
	defer db.Close()
	return true
}

func getAllDiscs(db *sql.DB) Discs {
	var query string

	query = "SELECT * FROM disc_catalog.disc ORDER BY speed DESC, turn ASC, fade ASC"

	results, err := db.Query(query)
	if err != nil {
		panic(err.Error())
	}

	discs := Discs{}

	for results.Next() {
		var disc Disc
		err = results.Scan(
			&disc.DiscId,
			&disc.Brand,
			&disc.Name,
			&disc.Plastic,
			&disc.Stability,
			&disc.Speed,
			&disc.Glide,
			&disc.Turn,
			&disc.Fade,
			&disc.IsInBag,
			&disc.IsCollected,
			&disc.IsOwned,
			&disc.Description,
			&disc.Notes,
			&disc.Link,
			)
		if err != nil {
			panic(err.Error())
		}

		discs = append(discs, disc)
	}
	fmt.Printf("Number of discs returned: %v\n", len(discs))
	defer db.Close()
	return discs
}

func getDatabaseConnection() *sql.DB {
	//db, err := sql.Open("postgres", os.Getenv("DATABASE_URL"))
	db, err := sql.Open("postgres", "postgres://prlgrktludlpfy:1723a94575704248af1d99b8683452ee3de33b48d88b18856c4109662b41b995@ec2-34-206-252-187.compute-1.amazonaws.com:5432/d3tvcfn8ldd2av")
	if err != nil {
		panic(err.Error())
	}
	return db
}

// Http and REST Utilities
func setupResponse(w *http.ResponseWriter, req *http.Request) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
	(*w).Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
	(*w).Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
}

func handleRequests() {
	Router := mux.NewRouter().StrictSlash(true)
	Router.HandleFunc("/", indexHandler)
	Router.HandleFunc("/status", statusHandler).Methods("GET", "OPTIONS")
	Router.HandleFunc("/discs", getAllDiscsHandler).Methods("GET", "OPTIONS")
	//Router.HandleFunc("/discs", postActiveDisc).Methods("POST", "OPTIONS")
	//Router.HandleFunc("/discs", updateActiveDisc).Methods("PUT", "OPTIONS")
	//Router.HandleFunc("/discs", deleteDisc).Methods("DELETE", "OPTIONS")

	port := os.Getenv("PORT")
	if port == "" {
		//log.Fatal("$PORT must be set")
		port ="3000"
	}

	log.Fatal(http.ListenAndServe(":" + port, Router))
}

func main() {
		handleRequests()
}
