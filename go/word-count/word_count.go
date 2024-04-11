package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	pattern := regexp.MustCompile(`[^a-zA-Z0-9']+`)
	words := pattern.Split(phrase, -1)
	out := map[string]int{}
	for _, word := range words {
		trimmed := strings.Trim(word, "'")
		if len(trimmed) == 0 {
			continue
		}
		normalized := strings.ToLower(trimmed)
		out[normalized] += 1
	}
	return out
}

// BenchmarkWordCount-4       29361             41786 ns/op           22636 B/op        294 allocs/op

// goos: linux
// goarch: amd64
// pkg: wordcount
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
