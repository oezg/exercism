// Package wordcount is a utility to analyze which words are used, and how often they're repeated.
package wordcount

import (
	"strings"
	"unicode"
)

// Frequency is a map between case insensitive words and their count.
type Frequency map[string]int

func (f Frequency) add(word string) {
	trimmed := strings.ToLower(strings.Trim(word, "'"))
	if len(trimmed) > 0 {
		f[trimmed]++
	}
}

// WordCount counts how many times each word occurs in a subtitle of a drama.
func WordCount(phrase string) Frequency {
	out := Frequency{}
	delimit := func(r rune) bool {
		return !(unicode.IsLetter(r) || unicode.IsNumber(r) || r == '\'')
	}
	for _, word := range strings.FieldsFunc(phrase, delimit) {
		out.add(word)
	}
	return out
}

// 4
// BenchmarkWordCount-4      168207              7202 ns/op            4352 B/op         47 allocs/op

// 3
// BenchmarkWordCount-4      169422              7616 ns/op            4352 B/op         47 allocs/op

// 2
// BenchmarkWordCount-4       45045             25237 ns/op            9759 B/op        125 allocs/op

// 1
// BenchmarkWordCount-4       29361             41786 ns/op           22636 B/op        294 allocs/op

// goos: linux
// goarch: amd64
// pkg: wordcount
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
