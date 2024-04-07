// Package triangle is a utility to determine if a triangle is equilateral, isosceles, or scalene.
package triangle

// Kind represents the type of triangle or not a triangle.
type Kind uint8

const (
	NaT Kind = iota // not a triangle
	Equ             // equilateral
	Iso             // isosceles
	Sca             // scalene
)

// KindFromSides returns the kind of triangle formed by the given three sides.
func KindFromSides(a, b, c float64) Kind {
	notTriangle := func() bool {
		return a < 0 || b < 0 || c < 0 || a+b < c || b+c < a || a+c < b || a == 0 && b == 0 && c == 0
	}
	scalene := func() bool {
		return a != b && b != c && a != c
	}
	equilateral := func() bool {
		return a == b && a == c
	}
	switch {
	case notTriangle():
		return NaT
	case scalene():
		return Sca
	case equilateral():
		return Equ
	default:
		return Iso
	}
}

// 1 small functions
// BenchmarkKind-4         28067139                40.49 ns/op            0 B/op          0 allocs/op

// 2 all logic inside switch
// BenchmarkKind-4         100000000               11.48 ns/op            0 B/op          0 allocs/op

// 3 nested functions
// BenchmarkKind-4         16549327                68.32 ns/op            0 B/op          0 allocs/op

// goos: linux
// goarch: amd64
// pkg: triangle
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
