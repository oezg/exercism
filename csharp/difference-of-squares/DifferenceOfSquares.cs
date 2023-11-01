using System;
using System.Linq;

public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max) 
        => checked(square(sumFirst(max)));

    public static int CalculateSumOfSquares(int max)
        => sumFirst(max) * (max * 2 + 1) / 3 ;

    public static int CalculateDifferenceOfSquares(int max) 
        => CalculateSquareOfSum(max) - CalculateSumOfSquares(max);

    private static int square(int n)
        => n * n;

    private static int sumFirst(int n)
        => n * (n + 1) / 2;
}