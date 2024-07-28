// Package acronym helps generate some jargon by converting a long name
// like Portable Network Graphics to its acronym (PNG).
package acronym

import (
	"strings"
	"unicode"
	"unicode/utf8"
)

// Abbreviate converts a phrase to its acronym.
func Abbreviate(s string) string {
	sb := strings.Builder{}

	fields := strings.FieldsFunc(s, func(r rune) bool {
		return !(unicode.IsLetter(r) || r == '\'')
	})

	for _, v := range fields {
		x, _ := utf8.DecodeRuneInString(v)
		sb.WriteRune(unicode.ToUpper(x))
	}

	return sb.String()
}

// 3. FieldsFunc && DecodeRuneInString
// BenchmarkAcronym-8        164881              7139 ns/op             824 B/op         19 allocs/op

// 2. declare `isLetter` inside the for loop
// BenchmarkAcronym-4       1000000              1096 ns/op              88 B/op         10 allocs/op

// 1. string builder
// BenchmarkAcronym-4        980565              1094 ns/op              88 B/op         10 allocs/op
