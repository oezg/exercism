using System;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number) 
        => number == number
            .ToString()
            .ToList()
            .Select(x => x - '0')
            .Select(x => Math.Pow(x, number.ToString().Length))
            .Sum();
}