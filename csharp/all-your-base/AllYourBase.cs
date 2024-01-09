using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

public static class AllYourBase
{
    public static int[] Rebase(int inputBase, int[] inputDigits, int outputBase)
    {
        ThrowExceptions(inputBase, inputDigits, outputBase);
        return ConvertToBaseArray(outputBase)(ConvertToBase10Value(inputDigits)(inputBase));
    }

    private static Func<int, int> ConvertToBase10Value(int[] inputDigits) 
        => inputBase => inputDigits
        .Select((digit, index) => digit * (int)Math.Pow(inputBase, inputDigits.Length - 1 - index))
        .Sum();

    private static Func<int, int[]> ConvertToBaseArray(int outputBase)
        => base10Value => base10Value == 0
                ? (new int[] { default })
                : GenerateDigits(base10Value, outputBase)
                .Reverse()
                .ToArray();

    private static IEnumerable<int> GenerateDigits(int val, int bas)
    {
        while (val > 0)
        {
            yield return val % bas;
            val /= bas;
        }
    }

    private static void ThrowExceptions(int inputBase, int[] inputDigits, int outputBase)
    {
        if (inputBase < 2 || outputBase < 2) 
            throw new ArgumentException("base can not be less than 2");
        if (inputDigits.Any(digit => digit < 0 || digit >= inputBase))
            throw new ArgumentException($"one of digits is not between 0 and {inputBase}");
    }
}