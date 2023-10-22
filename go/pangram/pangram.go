// Package pangram provides utility to test if a string is a pangram
package pangram

import (
	"strings"
	"unicode"
)

// IsPangram returns true if input contains every letter
// of the English alphabet at least once. It is case insensitive.
// The English alphabet contains 26 letters.
func IsPangram(input string) bool {
	bitfield := 0
	for _, letter := range input {
		if 'a' <= letter && letter <= 'z' {
			bitfield |= 1 << (letter - 'a')
		} else if 'A' <= letter && letter <= 'Z' {
			bitfield |= 1 << (letter - 'A')
		}
	}
	return bitfield+1 == 1<<('z'-'a'+1)
}

func IsPangram2(input string) bool {
	for _, letter := range "qwertzuiopasdfghjklyxcvbnm" {
		if strings.ContainsRune(input, letter) {
			continue
		}
		if strings.ContainsRune(input, unicode.ToUpper(letter)) {
			continue
		}
		return false
	}
	return true
}

func IsPangram1(input string) bool {
	letters := make(map[rune]bool)

	for _, letter := range input {
		if unicode.IsUpper(letter) {
			letter = unicode.ToLower(letter)
		}
		letters[letter] = true
	}

	for _, letter := range "qwertzuiopasdfghjklyxcvbnm" {
		if !letters[letter] {
			return false
		}
	}

	return true
}
