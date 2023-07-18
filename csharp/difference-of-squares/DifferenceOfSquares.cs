using System;
using System.Linq;

public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max) 
        => checked(Square((max + 1) * max / 2));

    public static int CalculateSumOfSquares(int max) 
        => Enumerable.Range(1, max).Sum(Square);

    public static int CalculateDifferenceOfSquares(int max) 
        => CalculateSquareOfSum(max) - CalculateSumOfSquares(max);

    private static int Square(int n) 
        => (int)Math.Pow(n, 2);
}