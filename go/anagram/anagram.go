// Package anagram is a utility to help find anagrams.
package anagram

import (
	"maps"
	"strings"
)

// Detect returns the anagrams of a given subject among the candidates.
func Detect(subject string, candidates []string) []string {
	out := []string{}
	target := strings.ToLower(subject)
	targetCounter := toCounter(target)
	for _, v := range candidates {
		candidate := strings.ToLower(v)
		if target == candidate || !maps.Equal(targetCounter, toCounter(candidate)) {
			continue
		}
		out = append(out, v)
	}
	return out
}

func toCounter(word string) map[rune]uint8 {
	frequency := make(map[rune]uint8)
	for _, letter := range word {
		frequency[letter]++
	}
	return frequency
}

// 6 Extract Map Creation and Remove Early Termination Check
// BenchmarkDetectAnagrams-4          81540             14048 ns/op            1473 B/op         61 allocs/op

// 5 stop counting earlier, uint8
// BenchmarkDetectAnagrams-4          86455             13238 ns/op            1088 B/op         56 allocs/op

// 3 maps.Equal
// BenchmarkDetectAnagrams-4          82233             13945 ns/op            1521 B/op         61 allocs/op

// 2 custom compare maps
// BenchmarkDetectAnagrams-4          82050             13679 ns/op            1521 B/op         61 allocs/op

// 1 reflect.DeepEqual
// BenchmarkDetectAnagrams-4          25994             44995 ns/op           12102 B/op        518 allocs/op

// goos: linux
// goarch: amd64
// pkg: anagram
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
