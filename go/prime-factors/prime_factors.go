// Package prime offers a utility to compute the prime factors of a given natural number.
// A prime number is only evenly divisible by itself and 1. 1 is not a prime number.
package prime

import (
	"math"
)

// Factors returns a list of prime numbers which evenly divide into the given natural number.
// The prime numbers are listed in the ascending order.
// Prime factor is included in the result list as many times as it divides into the given number.
func Factors(n int64) []int64 {
	out := []int64{}

	root := int64(math.Sqrt(float64(n / 2)))
	sieve := make([]bool, root+1)

	for i := int64(2); i < n && i < root+1; i++ {
		if sieve[i] {
			continue
		}
		for n%i == 0 {
			n /= i
			out = append(out, i)
		}

		for m := i * i; m < root; m += i {
			sieve[m] = true
		}
	}

	if n > 1 {
		out = append(out, n)
	}

	return out
}

// 5 Concat slices for each factor
// BenchmarkPrimeFactors-4             7856            151036 ns/op          356096 B/op         66 allocs/op

// 4 Search until square root
// BenchmarkPrimeFactors-4            28116             42287 ns/op             424 B/op         26 allocs/op

// 2 Exclude evens
// BenchmarkPrimeFactors-4              302           3920906 ns/op             424 B/op         26 allocs/op

// 1 One by one
// BenchmarkPrimeFactors-4              146           8097752 ns/op             424 B/op         26 allocs/op
