// Package atbash is an implementation of the atbash cipher, an ancient encryption system
// created in the Middle East. The Atbash cipher is a simple substitution cipher that relies
// on transposing all the letters in the alphabet such that the resulting alphabet is backwards.
// Ciphertext is written out in groups of fixed length, the traditional group size being 5
// letters, leaving numbers unchanged, and punctuation is excluded.
package atbash

import "unicode"

const groupSize = 5

// Atbash returns the ciphertext of the given string encoded in Atbash cipher.
func Atbash(s string) string {
	buffer := []rune{}
	i := 0
	for _, letter := range s {
		cipher := atbash(letter)
		if cipher < 0 {
			continue
		}

		if i > 0 && i%groupSize == 0 {
			buffer = append(buffer, ' ')
		}

		buffer = append(buffer, cipher)
		i++
	}
	return string(buffer)
}

func atbash(p rune) rune {
	switch {
	case p >= 'a' && p <= 'z':
		return 'z' - (p - 'a')
	case p >= 'A' && p <= 'Z':
		return 'z' - (p - 'A')
	case unicode.IsDigit(p):
		return p
	default:
		return -1
	}
}

// 1
// BenchmarkAtbash-4         439363              2389 ns/op            1224 B/op         34 allocs/op

// goos: linux
// goarch: amd64
// pkg: atbash
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
