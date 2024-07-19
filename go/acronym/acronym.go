// Package acronym helps generate some jargon by converting a long name
// like Portable Network Graphics to its acronym (PNG).
package acronym

import (
	"strings"
	"unicode"
)

// Abbreviate converts a phrase to its acronym.
func Abbreviate(s string) string {
	sb := strings.Builder{}
	leftWordBoundary := true
	for _, v := range s {
		isLetter := unicode.IsLetter(v)
		if leftWordBoundary && isLetter {
			sb.WriteRune(unicode.ToUpper(v))
			leftWordBoundary = false
		}
		if !leftWordBoundary && !isLetter && v != '\'' {
			leftWordBoundary = true
		}
	}
	return sb.String()
}

// 2. declare `isLetter` inside the for loop
// BenchmarkAcronym-4       1000000              1096 ns/op              88 B/op         10 allocs/op

// 1. string builder
// BenchmarkAcronym-4        980565              1094 ns/op              88 B/op         10 allocs/op
