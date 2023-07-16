using System;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
        => "abcdefghijklmnopqrstuvwxyz".ToList()
        .TrueForAll(ch => input.Contains(ch, StringComparison.OrdinalIgnoreCase));
}
