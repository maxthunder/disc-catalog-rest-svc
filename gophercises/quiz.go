package main

import (
	"bufio"
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"os"
)

//type QuizProblem struct {
//	FirstOperand int `json:"firstOperand"`
//}

func main()  {
	csvFile, _ := os.Open("problems.csv")
	reader := csv.NewReader(bufio.NewReader(csvFile))
	for {
		line, err := reader.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			log.Fatal(err)
		}
		fmt.Println("line[0]" + line[0])
		//fmt.Println("line[1]" + line[1])
	}
	fmt.Println("Hello, World")
}


