using System;
using System.Numerics;

public static class Grains
{
    public static ulong Square(int n) 
        => n > 0 && n < 65 ? 1UL << (n - 1) 
        : throw new ArgumentOutOfRangeException(nameof(n), n.ToString());


    public static ulong Total() => (ulong)((BigInteger.One << 64) - 1);


    public static ulong Total2() => ulong.MaxValue;

    
    public static ulong Total1()
        => unchecked(0 - 1ul);
}