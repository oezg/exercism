// Package summultiples calculates the energy points earned by the player.
package summultiples

import (
	"math/big"
	"slices"
)

// SumMultiples sums all the unique multiples of the divisors that are less than the limit.
func SumMultiples(limit int, divisors ...int) (sum int) {
	// return loopApproach(limit, divisors...)
	return sieveApproach(limit, divisors...)
	// return setApproach(limit, divisors...)
	// return bigintApproach(limit, divisors...)
	// return sortedSliceApproach(limit, divisors...)
}

func sortedSliceApproach(limit int, divisors ...int) (sum int) {
	uniques := []int{}

	for _, v := range divisors {

		for i := v; v > 0 && i < limit; i += v {

			target, ok := slices.BinarySearch(uniques, i)

			if ok {
				continue
			}

			uniques = slices.Insert(uniques, target, i)
			sum += i
		}
	}

	return
}

func bigintApproach(limit int, divisors ...int) (sum int) {
	sieve := big.Int{}

	for _, v := range divisors {

		for i := v; v > 0 && i < limit; i += v {

			if sieve.Bit(i) == 1 {
				continue
			}

			sieve.SetBit(&sieve, i, 1)
			sum += i
		}
	}

	return
}

func setApproach(limit int, divisors ...int) (sum int) {
	uniques := map[int]struct{}{}

	for _, v := range divisors {

		for i := v; v > 0 && i < limit; i += v {

			if _, ok := uniques[i]; ok {
				continue
			}

			uniques[i] = struct{}{}
			sum += i
		}
	}

	return
}

func sieveApproach(limit int, divisors ...int) (sum int) {
	sieve := make([]bool, limit)

	for _, v := range divisors {

		for i := v; v > 0 && i < limit; i += v {

			if sieve[i] {
				continue
			}

			sieve[i] = true
			sum += i
		}
	}

	return
}

func loopApproach(limit int, divisors ...int) (sum int) {

	for i := range limit {

		for _, v := range divisors {

			if v == 0 || i%v > 0 {
				continue
			}

			sum += i
			break
		}
	}

	return
}

// sorted slice approach
// BenchmarkSumMultiples-4              817           1418715 ns/op          280220 B/op         78 allocs/op

// bigint approach
// BenchmarkSumMultiples-4             8221            125799 ns/op           44136 B/op         82 allocs/op

// set approach
// BenchmarkSumMultiples-4             1375            871891 ns/op          443229 B/op        366 allocs/op

// sieve approach
// BenchmarkSumMultiples-4            64496             18429 ns/op           32264 B/op         16 allocs/op

// loop approach
// BenchmarkSumMultiples-4             2718            433160 ns/op               0 B/op          0 allocs/op
