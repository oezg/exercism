// Package cryptosquare implements the classic method for composing secret messages called a square code.
package cryptosquare

import (
	"math"
	"strings"
	"unicode"
)

// Given an English text, Encode outputs the encoded version of that text.
func Encode(pt string) string {
	normalized := make([]rune, 0, len(pt))
	for _, v := range strings.ToLower(pt) {
		if unicode.IsLetter(v) || unicode.IsDigit(v) {
			normalized = append(normalized, v)
		}
	}

	// Find the sides of the smallest square/rectangle
	length := len(normalized)
	row := int(math.Sqrt(float64(length)))
	col := row + 1
	if row*col < length {
		row++
	} else if row*row == length {
		col--
	}

	// Pad the code with space to fill the rectangle
	for i := length; i < row*col; i++ {
		normalized = append(normalized, ' ')
	}

	// Write the runes in the transposed position
	sb := strings.Builder{}
	sb.Grow((row + 1) * col)
	for i := 0; i < col; i++ {
		for j := 0; j < row; j++ {
			sb.WriteRune(normalized[j*col+i])
		}
		if i < col-1 {
			sb.WriteRune(' ')
		}
	}

	return sb.String()
}

// 11. call `ToLower` before iterating on the whole message.
// BenchmarkEncode-4         197564              5952 ns/op            2536 B/op         47 allocs/op

// 10. call `ToLower` in every case.
// BenchmarkEncode-4         214290              5539 ns/op            2176 B/op         38 allocs/op

// 9. `append` instead of indexing into `normalized`
// BenchmarkEncode-4         209914              5058 ns/op            2176 B/op         38 allocs/op

// 8. `unicode` package for filtering
// BenchmarkEncode-4         237376              4934 ns/op            2176 B/op         38 allocs/op

// 7. rune instead of byte slice and `WriteRune` instead of `WriteByte`
// BenchmarkEncode-4         269425              4268 ns/op            2176 B/op         38 allocs/op

// 6. index into `normalized` instead of append
// BenchmarkEncode-4         451284              2304 ns/op             944 B/op         38 allocs/op

// 5b. inline helper functions
// BenchmarkEncode-4         436002              2418 ns/op             944 B/op         38 allocs/op

// 5a. Eliminate matrix
// BenchmarkEncode-4         444442              2443 ns/op             944 B/op         38 allocs/op

// 4. Eliminate transposed matrix
// BenchmarkEncode-4         301648              4343 ns/op            2528 B/op         56 allocs/op

// 3. String builder instead of strings.Join
// BenchmarkEncode-4         191798              6851 ns/op            4696 B/op        148 allocs/op

// 2. preallocate array in `normalize`
// BenchmarkEncode-4         131874             10280 ns/op            6208 B/op        236 allocs/op

// 1. naive
// BenchmarkEncode-4         123711             11820 ns/op            6528 B/op        256 allocs/op
