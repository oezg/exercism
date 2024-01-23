using System;
using System.Linq;

public static class Triangle
{
    public static bool IsScalene(double side1, double side2, double side3)
        => helper(side1, side2, side3, (a, b, c) => a != b && a != c && b != c);

    public static bool IsIsosceles(double side1, double side2, double side3)
        => helper(side1, side2, side3, (a, b, c) => a == b || b == c || a == c);

    public static bool IsEquilateral(double side1, double side2, double side3)
        => helper(side1, side2, side3, (a, b, c) => a == b && b == c);

    private static bool IsValid(double side1, double side2, double side3)
        => (new double[] { side1, side2, side3, side1 + side2 - side3, side1 + side3 - side2, side2 + side3 - side1 }).All(isPositive);

    private static bool isPositive(double number)
        => number > 0;

    private static bool helper(double s1, double s2, double s3, Func<double, double, double, bool> func)
        => IsValid(s1, s2, s3) && func(s1, s2, s3);
}