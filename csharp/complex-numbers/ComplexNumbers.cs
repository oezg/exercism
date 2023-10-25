using System;

public struct ComplexNumber
{
    public double Re { get; }
    public double Im { get; }
    public readonly double SumOfSquares => Re * Re + Im * Im;

    /// <summary>
    /// The reciprocal of a non-zero complex number is 1 / (a + i * b) = a/(a^2 + b^2) - b/(a^2 + b^2) * i.
    /// </summary>
    /// <param name="other"></param>
    /// <returns></returns>
    public readonly ComplexNumber Reciprocal => Div(SumOfSquares).Conjugate();

    public readonly ComplexNumber Negation => new(-Re, -Im);

    public ComplexNumber(double real, double imaginary)
    {
        Re = real;
        Im = imaginary;
    }

    private ComplexNumber(double value) : this(value, 0) { }

    public readonly double Real() => Re;

    public readonly double Imaginary() => Im;


    /// <summary>
    /// Multiplication result is by definition (a + i * b) * (c + i * d) = (a * c - b * d) + (b * c + a * d) * i.
    /// </summary>
    /// <param name="other"></param>
    /// <returns></returns>
    public readonly ComplexNumber Mul(ComplexNumber other) => new(Re * other.Re - Im * other.Im, Im * other.Re + Re * other.Im);

    public readonly ComplexNumber Mul(double scalar) => new(Re * scalar, Im * scalar);

    public readonly ComplexNumber Add(ComplexNumber other) => new(Re + other.Re, Im + other.Im);

    public readonly ComplexNumber Add(double operand) => Add(new ComplexNumber(operand));

    public readonly ComplexNumber Sub(ComplexNumber other) => Add(other.Negation);

    public readonly ComplexNumber Sub(double operand) => Sub(new ComplexNumber(operand));

    public readonly ComplexNumber Div(ComplexNumber other) => Mul(other.Reciprocal);

    public readonly ComplexNumber Div(double denominator) => new(Re / denominator, Im / denominator);

    public readonly double Abs() => Math.Sqrt(SumOfSquares);

    public readonly ComplexNumber Conjugate() => new(Re, -Im);

    /// <summary>
    /// Raising e to a complex exponent can be expressed as e^(a + i * b) = e^a * e^(i * b), 
    /// the last term of which is given by Euler's formula e^(i * b) = cos(b) + i * sin(b).
    /// </summary>
    /// <returns></returns>
    public readonly ComplexNumber Exp() => new ComplexNumber(Math.Cos(Im), Math.Sin(Im)).Mul(Math.Exp(Re));

    public static ComplexNumber operator +(ComplexNumber a) => a;
    public static ComplexNumber operator +(ComplexNumber a, ComplexNumber b) => a.Add(b);
    public static ComplexNumber operator -(ComplexNumber a) => a.Negation;
    public static ComplexNumber operator -(ComplexNumber a, ComplexNumber b) => a.Sub(b);
    public static ComplexNumber operator *(ComplexNumber a, ComplexNumber b) => a.Mul(b);
    public static ComplexNumber operator /(ComplexNumber a, ComplexNumber b) => a.Div(b);
}