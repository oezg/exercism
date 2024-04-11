package wordcount

import (
	"strings"
	"unicode"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	out := make(Frequency)
	for _, word := range strings.FieldsFunc(phrase, func(r rune) bool {
		return !(unicode.IsLetter(r) || unicode.IsNumber(r) || r == '\'')
	}) {
		trimmed := strings.ToLower(strings.Trim(word, "'"))
		if trimmed == "" {
			continue
		}
		out[trimmed] += 1
	}
	return out
}

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
