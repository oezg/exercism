using System;
using System.Linq;

public static class RnaTranscription
{
    public static string ToRna(string nucleotide) 
        => new(nucleotide
            .Replace("A", "U")
            .Replace("T", "A")
            .Select(x => x == 'G' ? 'C' : x == 'C' ? 'G' : x)
            .ToArray());
}