// Package triangle is a utility to determine if a triangle is equilateral, isosceles, or scalene.
package triangle

// Kind represents the type of triangle or not a triangle.
type Kind int

const (
	NaT Kind = iota // not a triangle
	Equ             // equilateral
	Iso             // isosceles
	Sca             // scalene
)

// KindFromSides returns the kind of triangle formed by the given three sides.
func KindFromSides(a, b, c float64) Kind {
	switch {
	case notTriangle(a, b, c):
		return NaT
	case equilateral(a, b, c):
		return Equ
	case isosceles(a, b, c):
		return Iso
	default:
		return Sca
	}
}

func isosceles(a, b, c float64) bool {
	return a == b || a == c || b == c
}

func equilateral(a, b, c float64) bool {
	return a == b && a == c
}

func notTriangle(a, b, c float64) bool {
	if a == 0 && b == 0 && c == 0 {
		return true
	}
	return a+b < c || b+c < a || a+c < b
}
