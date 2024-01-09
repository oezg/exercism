using System;
using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> magicalBases, int level) 
        => magicalBases
        .Where(bas => bas > 0)
        .SelectMany(bas => Enumerable.Range(1, (level - 1) / bas)
        .Select(m => m * bas))
        .Distinct()
        .Sum();
}