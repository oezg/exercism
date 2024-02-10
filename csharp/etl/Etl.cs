using System;
using System.Collections.Generic;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        var metric = new Dictionary<string, int>();

        foreach (var pair in old)
            foreach (var letter in pair.Value)
                metric[letter.ToLower()] = pair.Key;
        
        return metric;
    }
}