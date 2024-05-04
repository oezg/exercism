package cipher

import (
	"strings"
)

type shift struct {
	distance int
}

type vigenere struct {
	keys []rune
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
	return code(input, s, 1)
}

func (s shift) Decode(input string) string {
	return code(input, s, -1)
}

func NewVigenere(key string) Cipher {
	if strings.ContainsFunc(key, func(r rune) bool {
		return r < 'a' || r > 'z'
	}) || !strings.ContainsFunc(key, func(r rune) bool {
		return r != 'a'
	}) {
		return nil
	}
	return vigenere{keys: []rune(key)}
}

func (v vigenere) Encode(input string) string {
	return code(input, v, 1)
}

func (v vigenere) Decode(input string) string {
	return code(input, v, -1)
}

func code(input string, c Cipher, direction int) string {
	var n, offset int
	var sb strings.Builder
	sb.Grow(len(input))
	for _, letter := range strings.ToLower(input) {
		if letter < 'a' || letter > 'z' {
			continue
		}
		switch v := c.(type) {
		case shift:
			offset = direction * v.distance
		case vigenere:
			offset = direction * int(v.keys[n%len(v.keys)]-'a')
		}
		sb.WriteRune((letter-'a'+rune(offset)+26)%26 + 'a')
		n++
	}
	return sb.String()
}

// 6 type switching
// BenchmarkEncodeShift-4            397117              2575 ns/op             472 B/op         17 allocs/op
// BenchmarkDecodeShift-4            578624              1901 ns/op             240 B/op          9 allocs/op
// BenchmarkNewVigenere-4           1552394               743.8 ns/op           408 B/op         10 allocs/op
// BenchmarkEncVigenere-4            698690              1583 ns/op             176 B/op         10 allocs/op
// BenchmarkDecVigenere-4            753327              1435 ns/op              80 B/op          6 allocs/op

// 5 deduplicate encode and decode
// BenchmarkEncodeShift-4            382975              2819 ns/op             472 B/op         17 allocs/op
// BenchmarkDecodeShift-4            545280              2014 ns/op             240 B/op          9 allocs/op
// BenchmarkNewVigenere-4           1714399               912.3 ns/op           648 B/op         10 allocs/op
// BenchmarkEncVigenere-4            627675              1904 ns/op             320 B/op         16 allocs/op
// BenchmarkDecVigenere-4            653851              1663 ns/op             224 B/op         12 allocs/op

// 4 vignere keys int slice and nth method
// BenchmarkEncodeShift-4            446500              2330 ns/op             472 B/op         17 allocs/op
// BenchmarkDecodeShift-4            824053              1310 ns/op             240 B/op          9 allocs/op
// BenchmarkNewVigenere-4           1751719               724.9 ns/op           648 B/op         10 allocs/op
// BenchmarkEncVigenere-4            725199              1516 ns/op             176 B/op         10 allocs/op
// BenchmarkDecVigenere-4            981404              1220 ns/op              80 B/op          6 allocs/op

// 3 with string builder
// BenchmarkEncodeShift-4            450146              2312 ns/op             472 B/op         17 allocs/op
// BenchmarkDecodeShift-4            695574              1490 ns/op             240 B/op          9 allocs/op
// BenchmarkNewVigenere-4           1734394               691.8 ns/op           408 B/op         10 allocs/op
// BenchmarkEncVigenere-4            729592              1510 ns/op             176 B/op         10 allocs/op
// BenchmarkDecVigenere-4            866185              1253 ns/op              80 B/op          6 allocs/op

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
