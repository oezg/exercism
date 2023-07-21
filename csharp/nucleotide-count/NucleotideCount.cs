using System;
using System.Collections.Generic;
using System.Linq;

public static class NucleotideCount
{
    private const string _nucleotides = "ATGC";

    public static IDictionary<char, int> Count(string sequence)
        => sequence.All(_nucleotides.Contains) 
        ? sequence.Concat(_nucleotides).GroupBy(c => c).ToDictionary(c => c.Key, c => c.Count() - 1)
        : throw new ArgumentException(s_message(sequence));

    private static string s_message(string sequence)
        => $"{string.Join(", ", sequence.Where(c => !_nucleotides.Contains(c)))} are not nucleotides!";
}