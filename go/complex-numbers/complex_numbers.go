package complexnumbers

import (
	"math"
)

type Number struct {
	real float64
	imag float64
}

func (n Number) Real() float64 {
	return n.real
}

func (n Number) Imaginary() float64 {
	return n.imag
}

func (n1 Number) Add(n2 Number) Number {
	return Number{
		real: n1.Real() + n2.Real(),
		imag: n1.Imaginary() + n2.Imaginary(),
	}
}

func (n1 Number) Subtract(n2 Number) Number {
	return n1.Add(n2.Times(-1))
}

func (n1 Number) Multiply(n2 Number) Number {
	return firstTerm(n1, n2).Subtract(secondTerm(n1, n2))
}

func (n Number) Times(factor float64) Number {
	return Number{
		real: n.Real() * factor,
		imag: n.Imaginary() * factor,
	}
}

func (n1 Number) Divide(n2 Number) Number {
	return firstTerm(n1, n2).Add(secondTerm(n1, n2)).Times(math.Pow(absSquared(n2), -1))
}

func (n Number) Conjugate() Number {
	return Number{
		real: n.Real(),
		imag: -n.Imaginary(),
	}
}

func (n Number) Abs() float64 {
	return math.Sqrt(absSquared(n))
}

func (n Number) Exp() Number {
	return Number{
		real: math.Cos(n.Imaginary()),
		imag: math.Sin(n.Imaginary()),
	}.Times(math.Pow(math.E, n.Real()))
}

func absSquared(n Number) float64 {
	return n.Multiply(n.Conjugate()).Real()
}

func firstTerm(n1, n2 Number) Number {
	return Number{
		real: n1.Real() * n2.Real(),
		imag: n1.Imaginary() * n2.Real(),
	}
}

func secondTerm(n1, n2 Number) Number {
	return Number{
		real: n1.Imaginary() * n2.Imaginary(),
		imag: -1 * n1.Real() * n2.Imaginary(),
	}
}
