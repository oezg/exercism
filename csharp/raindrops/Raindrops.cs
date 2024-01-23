using System;
using System.Collections.Generic;
using System.Linq;

public static class Raindrops
{
    public static string Convert(int number)
        => new Dictionary<int, string> {
            [3] = "i",
            [5] = "a",
            [7] = "o",
        }
        .Where(kvp => number.HasFactor(kvp.Key))
        .Select(kvp => $"Pl{kvp.Value}ng" )
        .DefaultIfEmpty(number.ToString())
        .Aggregate((acc, curr) => $"{acc}{curr}");

    public static bool HasFactor(this int number, int factor) => number % factor == 0;
}