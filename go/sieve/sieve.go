// Package sieve implements the Sieve of Eratosthenes algorithm to find all prime numbers less than or equal to a given number.
package sieve

import "math"

// Sieve returns the list of prime numbers less than or equal to limit
func Sieve(limit int) []int {
	// if limit < 2 {
	// 	return nil
	// }

	// approximation for the number of prime numbers less than or equal to a given limit
	primeNumbers :=
	primes := make([]int, 0, int(math.Max(1, float64(limit)/math.Log(float64(limit)))))
	sieve := make([]bool, limit+1)
	for i, v := range sieve {
		if i < 2 || v {
			continue
		}
		primes = append(primes, i)
		for j := i * i; j <= limit; j += i {
			sieve[j] = true
		}
	}
	return primes
}

// 3 prime number theorem
// BenchmarkSieve-4          316825              3451 ns/op            4688 B/op         10 allocs/op

// 2
// BenchmarkSieve-4          222042              5074 ns/op            5336 B/op         21 allocs/op

// 1
// BenchmarkSieve-4          228252              5291 ns/op            5336 B/op         22 allocs/op
