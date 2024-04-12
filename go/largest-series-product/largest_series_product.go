package lsproduct

import (
	"errors"
)

var (
	ErrInvalidInput error = errors.New("digits input must only contain digits")
	ErrNegativeSpan error = errors.New("span must not be negative")
	ErrTooLargeSpan error = errors.New("span must not be larger than input length")
)

func LargestSeriesProduct(input string, span int) (int64, error) {
	if span < 0 {
		return 0, ErrNegativeSpan
	}
	if span > len(input) {
		return 0, ErrTooLargeSpan
	}
	digits, err := toDigits(input)
	if err != nil {
		return 0, err
	}
	series := toSeries(digits, span)
	products := toProducts(series)
	return largestProduct(products), nil
}

func toDigits(input string) ([]int64, error) {
	out := []int64{}
	for _, digit := range input {
		if digit < '0' || digit > '9' {
			return nil, ErrInvalidInput
		}
		out = append(out, int64(digit-'0'))
	}
	return out, nil
}

func toSeries(digits []int64, span int) [][]int64 {
	out := [][]int64{}
	for i := 0; i < len(digits)-span+1; i++ {
		out = append(out, digits[i:i+span])
	}
	return out
}

func toProducts(series [][]int64) []int64 {
	out := make([]int64, 0, len(series))
	for _, serie := range series {
		product := int64(1)
		for _, digit := range serie {
			product *= digit
		}
		out = append(out, product)
	}
	return out
}

func largestProduct(products []int64) int64 {
	largest := int64(0)
	for _, product := range products {
		if largest < product {
			largest = product
		}
	}
	return largest
}

// goos: linux
// goarch: amd64
// pkg: lsproduct
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
// BenchmarkLargestSeriesProduct-4           182761              6332 ns/op            8864 B/op         88 allocs/op
