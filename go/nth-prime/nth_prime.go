// Package prime is utility to find the nth prime number.
package prime

import (
	"errors"
)

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
	var memory = []int{2, 3, 5, 7, 11, 13}
	if n < 1 {
		return 0, errors.New("n must be positive")
	}
	for x := memory[len(memory)-1] + 2; n > len(memory); x += 2 {
		if isNotPrime(x, memory) {
			continue
		}
		memory = append(memory, x)
	}
	return memory[n-1], nil
}

func isNotPrime(x int, memory []int) bool {
	for _, prime := range memory {
		if x%prime == 0 {
			return true
		}
		if prime*prime > x {
			break
		}
	}
	return false
}

// 3 Limit the range of primes checked up to the square root of x.
// BenchmarkNth-4               164           7267458 ns/op          351136 B/op         15 allocs/op

// 2 Clear or reinitialize memory at the start of each benchmark test
// to simulate the scenario where primes have to be recalculated.
// BenchmarkNth-4                 3         468360649 ns/op          351136 B/op         15 allocs/op

// 1
// BenchmarkNth-4          802869487                1.427 ns/op           0 B/op          0 allocs/op

// goos: linux
// goarch: amd64
// pkg: prime
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
