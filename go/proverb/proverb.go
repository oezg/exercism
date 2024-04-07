// Package proverb is utility to generate a proverb, from a list of inputs.
package proverb

import "fmt"

const (
	bodyLine = "For want of a %s the %s was lost."
	footLine = "And all for the want of a %s."
)

// Proverb returns the relevant proverb, generated from the given list of inputs.
func Proverb(rhyme []string) []string {
	out := make([]string, len(rhyme))
	for index, verse := range rhyme {
		if index == len(rhyme)-1 {
			out[index] = fmt.Sprintf(footLine, rhyme[0])
		} else {
			out[index] = fmt.Sprintf(bodyLine, verse, rhyme[index+1])
		}
	}
	return out
}

// 1 for range loop
// BenchmarkProverb-4        250234              4364 ns/op            1728 B/op         59 allocs/op

// 2 for statement
// BenchmarkProverb-4        256102              4373 ns/op            1728 B/op         59 allocs/op

// 3 recursion
// BenchmarkProverb-4        249721              4462 ns/op            1728 B/op         59 allocs/op

// 4 zip
// BenchmarkProverb-4        281851              4223 ns/op            1744 B/op         56 allocs/op

// 5
// BenchmarkProverb-4        291346              3813 ns/op            1472 B/op         51 allocs/op

// goos: linux
// goarch: amd64
// pkg: proverb
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
