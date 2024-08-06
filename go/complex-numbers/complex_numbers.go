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
	return Number{
		real: n1.Real() - n2.Real(),
		imag: n1.Imaginary() - n2.Imaginary(),
	}
}

func (n1 Number) Multiply(n2 Number) Number {
	return Number{
		real: n1.Real()*n2.Real() - n1.Imaginary()*n2.Imaginary(),
		imag: n1.Imaginary()*n2.Real() + n1.Real()*n2.Imaginary(),
	}
}

func (n Number) Times(factor float64) Number {
	return Number{
		real: n.Real() * factor,
		imag: n.Imaginary() * factor,
	}
}

func (n1 Number) Divide(n2 Number) Number {
	n2AbsSquared := n2.absSquared()
	return Number{
		real: (n1.Real()*n2.Real() + n1.Imaginary()*n2.Imaginary()) / n2AbsSquared,
		imag: (n1.Imaginary()*n2.Real() - n1.Real()*n2.Imaginary()) / n2AbsSquared,
	}
}

func (n Number) Conjugate() Number {
	return Number{
		real: n.Real(),
		imag: -n.Imaginary(),
	}
}

func (n Number) Abs() float64 {
	return math.Sqrt(n.absSquared())
}

func (n Number) Exp() Number {
	expReal := math.Pow(math.E, n.Real())
	return Number{
		real: math.Cos(n.Imaginary()) * expReal,
		imag: math.Sin(n.Imaginary()) * expReal,
	}
}

func (n Number) absSquared() float64 {
	return n.Real()*n.Real() + n.Imaginary()*n.Imaginary()
}
