using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public static class RomanNumeralExtension
{
    private static readonly Dictionary<int, Dictionary<char, string>> _romans;

    static RomanNumeralExtension()
        => _romans = new Dictionary<int, Dictionary<char, string>>()
        {
            [0] = new Dictionary<char, string>
            {
                ['0'] = "",
                ['1'] = "M",
                ['2'] = "MM",
                ['3'] = "MMM",
            },
            [1] = new Dictionary<char, string>
            {
                ['0'] = "",
                ['1'] = "C",
                ['2'] = "CC",
                ['3'] = "CCC",
                ['4'] = "CD",
                ['5'] = "D",
                ['6'] = "DC",
                ['7'] = "DCC",
                ['8'] = "DCC",
                ['9'] = "CM",
            }, 
            [2] = new Dictionary<char, string> 
            {
                ['0'] = "",
                ['1'] = "X",
                ['2'] = "XX",
                ['3'] = "XXX",
                ['4'] = "XL",
                ['5'] = "L",
                ['6'] = "LX",
                ['7'] = "LXX",
                ['8'] = "LXXX",
                ['9'] = "XC",
            },
            [3] = new Dictionary<char, string> 
            {
                ['0'] = "",
                ['1'] = "I",
                ['2'] = "II",
                ['3'] = "III",
                ['4'] = "IV",
                ['5'] = "V",
                ['6'] = "VI",
                ['7'] = "VII",
                ['8'] = "VIII",
                ['9'] = "IX",
            },
        };

    public static string ToRoman(this int value)
        => value
        is > 0 and < 4000 
        ? value
        .ToString()
        .PadLeft(4, '0')
        .Select((digit, index) => _romans[index][digit])
        .Aggregate(new StringBuilder(), (sb, roman) => sb.Append(roman))
        .ToString()
        : throw new ArgumentOutOfRangeException($"{nameof(value)} must be in range (0, 4000)");
}