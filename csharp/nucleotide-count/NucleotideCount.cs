using System;
using System.Collections.Generic;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        Dictionary<char, int> nucleotideCounts = new() { { 'A', 0}, { 'T', 0}, { 'G', 0}, { 'C', 0} };

        foreach (var item in sequence)
        {
            if (!nucleotideCounts.ContainsKey(item)) throw new ArgumentException(nameof(sequence));
            nucleotideCounts[item] += 1;
        }
        return nucleotideCounts;
    }
}