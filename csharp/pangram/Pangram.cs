using System;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram2(string input)
        => "abcdefghijklmnopqrstuvwxyz".All(x => input.ToLower().Contains(x));
        
    public static bool IsPangram(string input)
    {
        var mask = 0;
        var numLetters = 'z' - 'a' + 1;
        foreach (var item in input)
        {
            if (char.IsLetter(item))
            {
                var dif = item <= 'Z' ? item - 'A' : item - 'a';
                mask |= 1 << dif;
            }
        }
        return mask == (1 << numLetters) - 1;
    }
}
