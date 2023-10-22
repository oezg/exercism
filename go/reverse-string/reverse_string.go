// Package reverse provides a utility to reverse a string
package reverse

import "strings"

// Reverse returns the input reversed.
func Reverse(input string) string {
	runes := []rune(input)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

func Reverse2(input string) string {
	sb := strings.Builder{}
	runes := []rune(input)
	for i := len(runes) - 1; i >= 0; i-- {
		sb.WriteRune(runes[i])
	}
	return sb.String()
}

func Reverse1(input string) (result string) {
	for _, letter := range input {
		result = string(letter) + result
	}
	return
}
