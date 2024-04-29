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
	targetMap := make(map[rune]uint8)
	for _, char := range target {
		targetMap[char] += 1
	}
OUTER:
	for _, v := range candidates {
		candidate := strings.ToLower(v)
		if target == candidate {
			continue
		}
		candidateMap := make(map[rune]uint8)
		for _, char := range candidate {
			candidateMap[char] += 1
			if candidateMap[char] > targetMap[char] {
				continue OUTER
			}
		}
		if !maps.Equal(targetMap, candidateMap) {
			continue
		}
		out = append(out, v)
	}
	return out
}

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
