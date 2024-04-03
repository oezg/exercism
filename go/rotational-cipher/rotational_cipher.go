// Package rotationalcipher is an implementation of the rotational cipher.
package rotationalcipher

import (
	"strings"
)

// RotationalCipher encodes the given string using the Caesar cipher.
func RotationalCipher(plain string, shiftKey int) string {
	mod := 'Z' - 'A' + 1
	sb := strings.Builder{}
	sb.Grow(len(plain))
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

// 3
// cpu: 11th Gen Intel(R) Core(TM) i9-11950H @ 2.60GHz
// BenchmarkRotationalCipher-16     1532994               812.5 ns/op           280 B/op         16 allocs/op
// BenchmarkRotationalCipher-16     1519285               811.6 ns/op           280 B/op         16 allocs/op

// 4
// cpu: 11th Gen Intel(R) Core(TM) i9-11950H @ 2.60GHz
// BenchmarkRotationalCipher-16     1985257               578.3 ns/op           112 B/op          9 allocs/op
// BenchmarkRotationalCipher-16     2031672               587.2 ns/op           112 B/op          9 allocs/op
