// Package complexnumbers provides operations on complex numbers.
package complexnumbers

import (
	"math"
)

// Number represents a complex number in the form a + b * i where a and b are real and i satisfies i^2 = -1.
type Number struct {
	real float64
	imag float64
}

// Real returns the real part.
func (n Number) Real() float64 {
	return n.real
}

// Imaginary returns the imaginary part.
func (n Number) Imaginary() float64 {
	return n.imag
}

// Add (a + i * b) + (c + i * d) = (a + c) + (b + d) * i
func (n1 Number) Add(n2 Number) Number {
	return Number{
		real: n1.Real() + n2.Real(),
		imag: n1.Imaginary() + n2.Imaginary(),
	}
}

// Subtract (a + i * b) - (c + i * d) = (a - c) + (b - d) * i
func (n1 Number) Subtract(n2 Number) Number {
	return n1.Add(n2.Times(-1))
}

// Multiply (a + i * b) * (c + i * d) = (a * c - b * d) + (b * c + a * d) * i
func (n1 Number) Multiply(n2 Number) Number {
	return n1.Times(n2.Real()).Subtract(n1.Swap().Conjugate().Times(n2.Imaginary()))
}

// Times n * (a + i * b) = a * n + i * b * n
func (n Number) Times(factor float64) Number {
	return Number{
		real: n.Real() * factor,
		imag: n.Imaginary() * factor,
	}
}

// Swap a + i * b = b + i * a
func (n Number) Swap() Number {
	return Number{real: n.Imaginary(), imag: n.Real()}
}

// Divide (a + i * b) / (c + i * d)
// = (a * c + b * d) / (c^2 + d^2) + i * (b * c - a * d) / (c^2 + d^2)
// = (a * c + b * d + i * b * c - i * a * d) / (c^2 + d^2)
// = ((a + i * b) * c + (b - i * a) * d) / (c^2 + d^2)
// = (n1 * n2Real + n1SwapConjugate * n2Imaginary) * |n2|^-2
func (n1 Number) Divide(n2 Number) Number {
	form1 := n1.Times(n2.Real())
	form2 := n1.Swap().Conjugate().Times(n2.Imaginary())
	return form1.Add(form2).Times(math.Pow(n2.Abs(), -2))
}

// Conjugate a + i * b = a - b * i
func (n Number) Conjugate() Number {
	return Number{
		real: n.Real(),
		imag: -n.Imaginary(),
	}
}

// Abs |z| = sqrt(z * conjugate z)
func (n Number) Abs() float64 {
	return math.Sqrt(n.Multiply(n.Conjugate()).Real())
}

// Exp e^(a + i * b) = e^a * (cos(b) + i * sin(b))
func (n Number) Exp() Number {
	return Number{
		real: math.Cos(n.Imaginary()),
		imag: math.Sin(n.Imaginary()),
	}.Times(math.Pow(math.E, n.Real()))
}
