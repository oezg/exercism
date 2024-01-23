using System;
using System.Collections.Generic;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
        => number == number.DigitsRec(new List<int> {}).Sum(n => Math.Pow(n, number.ToString().Length));

    public static IEnumerable<int> DigitsRec(this int n, List<int> aggregator)
    {
        if (n < 1) {
            return aggregator;
        }
        aggregator.Add(n % 10);
        return (n / 10).DigitsRec(aggregator);
    }

    public static IEnumerable<int> Digits(this int n)
    {
        while (n > 0)
        {
            yield return n % 10;
            n /= 10;
        }
    }
}