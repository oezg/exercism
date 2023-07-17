using System;

public static class Grains
{
    public static ulong Square(int n) 
        => n > 0 && n < 65 ? 1UL << (n - 1) 
        : throw new ArgumentOutOfRangeException(nameof(n), n.ToString());

    public static ulong Total()
        => unchecked(0 - 1ul);
}