package cipher

import (
	"strings"
)

type shift struct {
	distance int
}

type vigenere struct {
	key []rune
}

func NewCaesar() Cipher {
	return shift{distance: 3}
}

func NewShift(distance int) Cipher {
	if distance < -25 || distance > 25 || distance == 0 {
		return nil
	}
	return shift{distance: distance}
}

func (s shift) Encode(input string) string {
	out := make([]rune, 0, len(input))
	for _, letter := range strings.ToLower(input) {
		if letter < 'a' || letter > 'z' {
			continue
		}
		substitute := (letter - 'a' + rune(s.distance) + 26) % 26
		out = append(out, substitute+'a')
	}
	return string(out)
}

func (s shift) Decode(input string) string {
	out := make([]rune, 0, len(input))
	for _, letter := range input {
		substitute := ((letter-'a'-rune(s.distance))%26+26)%26 + 'a'
		out = append(out, substitute)
	}
	return string(out)
}

func NewVigenere(key string) Cipher {
	if strings.ContainsFunc(key, func(r rune) bool {
		return r < 'a' || r > 'z'
	}) || !strings.ContainsFunc(key, func(r rune) bool {
		return r != 'a'
	}) {
		return nil
	}
	return vigenere{key: []rune(key)}
}

func (v vigenere) Encode(input string) string {
	out := make([]rune, 0, len(input))
	j := 0
	for _, letter := range strings.ToLower(input) {
		if letter < 'a' || letter > 'z' {
			continue
		}
		distance := v.key[j%len(v.key)] - 'a'
		j++
		substitute := ((letter-'a'+distance)%26 + 26) % 26
		out = append(out, substitute+'a')
	}
	return string(out)
}

func (v vigenere) Decode(input string) string {
	out := make([]rune, 0, len(input))
	for i, letter := range input {
		distance := v.key[i%len(v.key)] - 'a'
		substitute := ((letter-'a'-distance)%26+26)%26 + 'a'
		out = append(out, substitute)
	}
	return string(out)
}

// 2 without regex
// BenchmarkEncodeShift-4            323817              3633 ns/op            1494 B/op         28 allocs/op
// BenchmarkDecodeShift-4            432855              2510 ns/op            1118 B/op         20 allocs/op
// BenchmarkNewVigenere-4           1573244               726.3 ns/op           408 B/op         10 allocs/op
// BenchmarkEncVigenere-4            554090              1906 ns/op             520 B/op         16 allocs/op
// BenchmarkDecVigenere-4            797516              1517 ns/op             392 B/op         12 allocs/op

// 1 with regex
// BenchmarkEncodeShift-4             78375             14644 ns/op            2074 B/op         64 allocs/op
// BenchmarkDecodeShift-4            427220              2608 ns/op            1118 B/op         20 allocs/op
// BenchmarkNewVigenere-4            496921              2043 ns/op             408 B/op         10 allocs/op
// BenchmarkEncVigenere-4            200913              5460 ns/op             652 B/op         30 allocs/op
// BenchmarkDecVigenere-4            667450              1511 ns/op             392 B/op         12 allocs/op

// goos: linux
// goarch: amd64
// pkg: cipher
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
