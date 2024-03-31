// Package rotationalcipher is an implementation of the rotational cipher.
package rotationalcipher

import (
	"strings"
)

// RotationalCipher encodes the given string using the Caesar cipher.
func RotationalCipher(plain string, shiftKey int) string {
	mod := 'Z' - 'A' + 1
	sb := strings.Builder{}
	for _, letter := range plain {
		if letter >= 'A' && letter <= 'Z' {
			letter = ((letter - 'A' + rune(shiftKey)) % mod) + 'A'
		} else if letter >= 'a' && letter <= 'z' {
			letter = ((letter - 'a' + rune(shiftKey)) % mod) + 'a'
		}
		sb.WriteRune(letter)
	}
	return sb.String()
}

// 1
// BenchmarkRotationalCipher-4       297240              3927 ns/op            2728 B/op         34 allocs/op
// BenchmarkRotationalCipher-4       300488              3900 ns/op            2728 B/op         34 allocs/op

// 2
// BenchmarkRotationalCipher-4        29702             41525 ns/op           27426 B/op        124 allocs/op

// 3
// BenchmarkRotationalCipher-4      1223875               947.3 ns/op           280 B/op         16 allocs/op
// BenchmarkRotationalCipher-4      1240987               955.8 ns/op           280 B/op         16 allocs/op
