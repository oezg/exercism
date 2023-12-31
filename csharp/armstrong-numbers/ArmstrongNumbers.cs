using System;
using System.Collections.Generic;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
        => number == number.Digits().Sum(n => Math.Pow(n, number.Digits().Count()));

    public static IEnumerable<int> Digits(this int n)
    {
        while (n > 0)
        {
            yield return n % 10;
            n /= 10;
        }
    }
}