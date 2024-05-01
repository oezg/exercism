package cipher

import (
	"regexp"
	"strings"
)

// Define the shift and vigenere types here.
// Both types should satisfy the Cipher interface.

type shift struct {
	distance int
}

type vigenere struct {
	key []rune
}

var (
	regex         = regexp.MustCompile("[^A-Za-z]")
	aOnly         = regexp.MustCompile("^a+$")
	lowercaseOnly = regexp.MustCompile("^[a-z]+$")
)

func NewCaesar() Cipher {
	return shift{distance: 3}
}

func NewShift(distance int) Cipher {
	if distance < -25 || distance > 25 || distance == 0 {
		return nil
	}
	return shift{distance: distance}
}

func (c shift) Encode(input string) string {
	trimmmed := regex.ReplaceAllLiteralString(input, "")
	lowerTrimmed := strings.ToLower(trimmmed)
	out := make([]rune, 0, len(lowerTrimmed))
	for _, letter := range lowerTrimmed {
		substitute := ((letter-'a'+rune(c.distance))%26+26)%26 + 'a'
		out = append(out, substitute)
	}
	return string(out)
}

func (c shift) Decode(input string) string {
	out := make([]rune, 0, len(input))
	for _, letter := range input {
		substitute := ((letter-'a'-rune(c.distance))%26+26)%26 + 'a'
		out = append(out, substitute)
	}
	return string(out)
}

func NewVigenere(key string) Cipher {
	if aOnly.MatchString(key) || !lowercaseOnly.MatchString(key) {
		return nil
	}
	return vigenere{key: []rune(key)}
}

func (v vigenere) Encode(input string) string {
	trimmmed := regex.ReplaceAllLiteralString(input, "")
	lowerTrimmed := strings.ToLower(trimmmed)
	out := make([]rune, 0, len(lowerTrimmed))
	for i, letter := range lowerTrimmed {
		distance := v.key[i%len(v.key)] - 'a'
		substitute := ((letter-'a'+distance)%26+26)%26 + 'a'
		out = append(out, substitute)
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

// goos: linux
// goarch: amd64
// pkg: cipher
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
// BenchmarkEncodeCaesar-4           160540              7076 ns/op             868 B/op         34 allocs/op
// BenchmarkDecodeCaesar-4           874173              1190 ns/op             486 B/op         12 allocs/op
// BenchmarkNewShift-4             58339704                18.34 ns/op            0 B/op          0 allocs/op
// BenchmarkEncodeShift-4             78375             14644 ns/op            2074 B/op         64 allocs/op
// BenchmarkDecodeShift-4            427220              2608 ns/op            1118 B/op         20 allocs/op
// BenchmarkNewVigenere-4            496921              2043 ns/op             408 B/op         10 allocs/op
// BenchmarkEncVigenere-4            200913              5460 ns/op             652 B/op         30 allocs/op
// BenchmarkDecVigenere-4            667450              1511 ns/op             392 B/op         12 allocs/op
