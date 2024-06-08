using System;

public struct ComplexNumber
{
    private readonly double _re;
    private readonly double _im;

    public readonly double SumOfSquares => _re * _re + _im * _im;
    public readonly ComplexNumber Reciprocal => Div(SumOfSquares).Conjugate();

    public readonly ComplexNumber Negation => new(-_re, -_im);

    public ComplexNumber(double real, double imaginary)
    {
        _re = real;
        _im = imaginary;
    }

    public readonly double Real() => _re;

    public readonly double Imaginary() => _im;

    public readonly ComplexNumber Mul(ComplexNumber other) =>
        new(_re * other._re - _im * other._im, _im * other._re + _re * other._im);

    public readonly ComplexNumber Mul(double scalar) => new(_re * scalar, _im * scalar);

    public readonly ComplexNumber Add(ComplexNumber other) => new(_re + other._re, _im + other._im);

    public readonly ComplexNumber Add(double operand) => Add(new ComplexNumber(operand, 0));

    public readonly ComplexNumber Sub(ComplexNumber other) => Add(other.Negation);

    public readonly ComplexNumber Sub(double operand) => Sub(new ComplexNumber(operand, 0));

    public readonly ComplexNumber Div(ComplexNumber other) => Mul(other.Reciprocal);

    public readonly ComplexNumber Div(double denominator) => Mul(1 / denominator);

    public readonly double Abs() => Math.Sqrt(SumOfSquares);

    public readonly ComplexNumber Conjugate() => new(_re, -_im);

    public readonly ComplexNumber Exp() => new ComplexNumber(Math.Cos(_im), Math.Sin(_im)).Mul(Math.Exp(_re));
}