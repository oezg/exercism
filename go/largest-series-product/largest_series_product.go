// Package lsproduct is utility to look for patterns in the long sequence of digits in the encrypted signal.
package lsproduct

import (
	"errors"
)

// LargestSeriesProduct finds the largest product among series of given span in the input.
func LargestSeriesProduct(input string, span int) (int64, error) {
	if span < 0 || span > len(input) {
		return 0, errors.New("span must be between 0 and input length")
	}
	largestProduct := int64(0)
	buffer := make([]int64, span)
	for i, digit := range input {
		if digit < '0' || digit > '9' {
			return 0, errors.New("digits input must only contain digits")
		}

		buffer[i%span] = int64(digit - '0')

		if i < span-1 {
			continue
		}

		product := int64(1)
		for _, v := range buffer {
			product *= v
		}

		if largestProduct < product {
			largestProduct = product
		}
	}
	return largestProduct, nil
}

// 7 Buffer (smaller memory footprint)
// BenchmarkLargestSeriesProduct-4           561106              1847 ns/op             312 B/op         14 allocs/op

// 6 One pass
// BenchmarkLargestSeriesProduct-4           869005              1171 ns/op            1024 B/op         14 allocs/op

// 5 Two pass
// BenchmarkLargestSeriesProduct-4           444876              2631 ns/op            2576 B/op         48 allocs/op

// 4 Anonymous errors
// BenchmarkLargestSeriesProduct-4           177628              6471 ns/op            8928 B/op         92 allocs/op

// 3 Different errors
// BenchmarkLargestSeriesProduct-4           182761              6332 ns/op            8864 B/op         88 allocs/op

// goos: linux
// goarch: amd64
// pkg: lsproduct
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
