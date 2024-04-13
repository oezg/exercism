// Package prime is utility to find the nth prime number.
package prime

import (
	"errors"
)

var memory = []int{2, 3, 5, 7, 11, 13}

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
	if n < 1 {
		return 0, errors.New("n cannot be less than one")
	}
	for x := memory[len(memory)-1] + 2; n > len(memory); x += 2 {
		if isNotPrime(x) {
			continue
		}
		memory = append(memory, x)
	}
	return memory[n-1], nil
}

func isNotPrime(x int) bool {
	for _, prime := range memory {
		if x%prime == 0 {
			return true
		}
	}
	return false
}

// 1
// BenchmarkNth-4          802869487                1.427 ns/op           0 B/op          0 allocs/op

// goos: linux
// goarch: amd64
// pkg: prime
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
