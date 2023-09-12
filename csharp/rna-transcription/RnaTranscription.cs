using System;
using System.Linq;

public static class RnaTranscription
{
    public static string ToRna(string nucleotide) 
        => new(nucleotide
            .Select(x => x switch
            {
                'G' => 'C',
                'C' => 'G',
                'A' => 'U',
                'T' => 'A',
                _ => throw new Exception("MUTANT!")
            })
            .ToArray());
}