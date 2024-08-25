// Package cryptosquare implements the classic method for composing secret messages called a square code.
package cryptosquare

import (
	"math"
	"strings"
)

// Given an English text, Encode outputs the encoded version of that text.
func Encode(pt string) string {
	length := 0
	normalized := make([]byte, len(pt))
	for _, v := range []byte(pt) {
		if 'a' <= v && v <= 'z' || '0' <= v && v <= '9' {
			normalized[length] = v
			length++
		} else if 'A' <= v && v <= 'Z' {
			normalized[length] = 32 + v
			length++
		}
	}

	row := int(math.Sqrt(float64(length)))
	col := row + 1
	if row*col < length {
		row++
	} else if row*row == length {
		col--
	}

	normalized = normalized[:length]

	for i := length; i < row*col; i++ {
		normalized = append(normalized, ' ')
	}

	sb := strings.Builder{}
	sb.Grow((row + 1) * col)

	for i := 0; i < col; i++ {
		for j := 0; j < row; j++ {
			sb.WriteByte(normalized[j*col+i])
		}
		if i < col-1 {
			sb.WriteByte(' ')
		}
	}

	return sb.String()
}

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
