using System;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        return "abcdefghijklmnopqrstuvwxyz".ToList().Aggregate(true, (acc, curr) => acc && input.Contains(curr, StringComparison.OrdinalIgnoreCase));
    }
}
