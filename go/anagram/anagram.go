// Package anagram is a utility to help find anagrams.
package anagram

import (
	"strings"
)

type counter map[rune]uint16

func (c counter) notEquals(other counter) bool {
	if len(c) != len(other) {
		return true
	}
	for k, v := range c {
		if other[k] != v {
			return true
		}
	}
	return false
}

// Detect returns the anagrams of a given subject among the candidates.
func Detect(subject string, candidates []string) []string {
	out := []string{}
	target := strings.ToLower(subject)
	targetMap := toCounter(target)
	for _, v := range candidates {
		candidate := strings.ToLower(v)
		if target == candidate || targetMap.notEquals(toCounter(candidate)) {
			continue
		}
		out = append(out, v)
	}
	return out
}

func toCounter(word string) counter {
	out := make(map[rune]uint16)
	for _, char := range word {
		out[char] += 1
	}
	return out
}

// 1 reflect to compare maps
// BenchmarkDetectAnagrams-4          25994             44995 ns/op           12102 B/op        518 allocs/op

// 2 manually compare maps
// BenchmarkDetectAnagrams-4          82050             13679 ns/op            1521 B/op         61 allocs/op
