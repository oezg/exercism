// Package isogram implements a utility routine for checking if a word is isogram.
package isogram

import (
	"unicode"
)

// IsIsogram checks if a word is without a repeating letter, case insensitive.
// However, spaces and hyphens are allowed to appear multiple times.
func IsIsogram(word string) bool {
	set := make(map[rune]struct{})
	for _, chr := range word {
		if unicode.IsSpace(chr) || chr == '-' || !unicode.IsLetter(chr) {
			continue
		}
		if unicode.IsUpper(chr) {
			chr = unicode.ToLower(chr)
		}
		if _, exists := set[chr]; exists {
			return false
		}
		set[chr] = struct{}{}
	}
	return true
}
