package main

import (
	"fmt"
	"sync"
	"time"
)

var wg sync.WaitGroup

func worker(id int) {
	defer wg.Done()
	fmt.Printf("Worker %d starting\n", id)
	time.Sleep(time.Second)
	fmt.Printf("Worker %d done\n", id)
}

func main() {
	for i := 1; i <= 5; i++ {
		wg.Add(1)
		go worker(i)
	}
	wg.Wait()
}

// func worker(id int, jobs <-chan int, results chan<- int) {
// 	for j := range jobs {
// 		fmt.Println("Worker", id, "processing job", j)
// 		time.Sleep(time.Second)
// 		results <- j * 2
// 	}
// }

// func main() {
// 	const numJobs = 5
// 	jobs := make(chan int, numJobs)
// 	results := make(chan int, numJobs)

// 	for w := 1; w <= 3; w++ {
// 		go worker(w, jobs, results)
// 	}

// 	for j := 1; j <= numJobs; j++ {
// 		jobs <- j
// 	}
// 	close(jobs)

// 	for a := 1; a <= numJobs; a++ {
// 		fmt.Println("Result:", <-results)
// 	}
// }

// func printMessage(message chan string) {
// 	time.Sleep(time.Second * 2)
// 	message <- "Hello from Goroutine"
// }

// func main() {
// 	message := make(chan string)
// 	go printMessage(message)
// 	fmt.Println("Hello from main function")
// 	fmt.Println(<-message)
// }
