using System;
using System.Collections.Generic;
using System.Linq;

public static class RomanNumeralExtension
{
    public static string ToRoman(this int value) =>
        string.Join("", value.digits().Select((digit, index) => romans[index][digit]).Reverse());

    static readonly Dictionary<int, string[]> romans = new()
    {
        [0] = new string[] { "", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" },
        [1] = new string[] { "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC" },
        [2] = new string[] { "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM" },
        [3] = new string[] { "", "M", "MM", "MMM", "", "", "", "", "", "", "" }
    };

    /// <summary>
    /// Returns the digits of <paramref name="value"/> from right.
    /// </summary>
    /// <param name="value"> Number in range [1, 4000). </param>
    /// <returns> Digits from right. </returns>
    static IEnumerable<int> digits(this int value)
    {
        for (int n = value; n > 0; n /= 10) yield return n % 10;
    }
}