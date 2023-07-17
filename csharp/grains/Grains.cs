using System;
using System.Linq;

public static class Grains
{
    public static ulong Square(int n) 
        => n > 0 && n < 65 ? 1UL << (n - 1) 
        : throw new ArgumentOutOfRangeException(nameof(n), n.ToString());

    public static ulong Total() 
        => Enumerable.Range(1, 64).Aggregate(0UL, (acc, curr) => acc + Square(curr));
}