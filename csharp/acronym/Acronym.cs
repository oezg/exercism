using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class Acronym
{
    public static string Abbreviate(string phrase)
        => string.Join(
            "", 
            Regex.Matches(phrase, @"[\w\p{Po}]*?([A-Za-z])[\w\p{Po}]*")
            .Select(m => m.Groups[1].Value.ToUpper()));
}