// Package proverb is utility to generate a proverb, from a list of inputs.
package proverb

import "fmt"

const (
	bodyLine = "For want of a %s the %s was lost."
	footLine = "And all for the want of a %s."
)

// Proverb returns the relevant proverb, generated from the given list of inputs.
func Proverb(rhyme []string) []string {
	if len(rhyme) == 0 {
		return []string{}
	}

	out := make([]string, 0, len(rhyme))
	lastVerse := rhyme[0]

	for _, verse := range rhyme[1:] {
		out = append(out, fmt.Sprintf(bodyLine, lastVerse, verse))
		lastVerse = verse
	}

	return append(out, fmt.Sprintf(footLine, rhyme[0]))
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

// 6 indented happy path
// BenchmarkProverb-4        200809              5740 ns/op            2048 B/op         75 allocs/op

// 7 unindent happy path
// BenchmarkProverb-4        292440              3866 ns/op            1472 B/op         51 allocs/op

// goos: linux
// goarch: amd64
// pkg: proverb
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
