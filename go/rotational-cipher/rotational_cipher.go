// Package rotationalcipher is an implementation of the rotational cipher.
package rotationalcipher

import "strings"

const (
	upperA = 'A'
	lowerA = 'a'
	mod    = 'Z' - upperA + 1
)

// RotationalCipher encodes the given string using the Caesar cipher.
func RotationalCipher(plain string, shiftKey int) string {
	key := rune(shiftKey % mod)
	upper := upperA - key
	lower := lowerA - key
	sb := strings.Builder{}
	sb.Grow(len(plain))
	for _, letter := range plain {
		switch {
		case letter >= upperA && letter <= 'Z':
			sb.WriteRune(((letter - upper) % mod) + upperA)
		case letter >= lowerA && letter <= 'z':
			sb.WriteRune(((letter - lower) % mod) + lowerA)
		default:
			sb.WriteRune(letter)
		}
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

// 3 i9-11950H @ 2.60GHz
// BenchmarkRotationalCipher-16     1532994               812.5 ns/op           280 B/op         16 allocs/op
// BenchmarkRotationalCipher-16     1519285               811.6 ns/op           280 B/op         16 allocs/op

// 4 i9-11950H @ 2.60GHz
// BenchmarkRotationalCipher-16     1985257               578.3 ns/op           112 B/op          9 allocs/op
// BenchmarkRotationalCipher-16     2031672               587.2 ns/op           112 B/op          9 allocs/op

// 5 i9-11950H @ 2.60GHz
// BenchmarkRotationalCipher-16     1509146               811.5 ns/op           456 B/op         10 allocs/op
// BenchmarkRotationalCipher-16     1493668               828.1 ns/op           456 B/op         10 allocs/op

// 7 i9-11950H @ 2.60GHz
// BenchmarkRotationalCipher-16     2140963               559.2 ns/op           112 B/op          9 allocs/op
// BenchmarkRotationalCipher-16     2106626               550.9 ns/op           112 B/op          9 allocs/op
