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
	case !valid(a, b, c):
		return NaT

	}
}

func valid(a, b, c float64) bool {
	return a+b >= c && b+c >= a && a+c >= b
}
