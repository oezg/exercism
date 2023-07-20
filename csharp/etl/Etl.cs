using System;
using System.Collections.Generic;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        Dictionary<string, int> metric = new Dictionary<string, int>();
        foreach (KeyValuePair<int, string[]> pair in old)
        {
            foreach (string letter in pair.Value)
            {
                metric[letter.ToLower()] = pair.Key;
            }
        }
        return metric;
    }
}