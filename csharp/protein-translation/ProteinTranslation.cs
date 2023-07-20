using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    private const int CodonLength = 3;
    public static string[] Proteins(string strand)
        => Enumerable.Range(0, strand.Length / CodonLength)
        .Select(i       => strand.Substring(CodonLength * i, CodonLength))
        .TakeWhile(c    => !(c == "UAA" || c == "UAG" || c == "UGA"))
        .Translate().ToArray();

    private static IEnumerable<string> Translate(this IEnumerable<string> codons)
        => codons.Select(codon => codon switch
        {
            "AUG"                               => "Methionine",
            "UUU" or "UUC"                      => "Phenylalanine",
            "UUA" or "UUG"                      => "Leucine",
            "UCU" or "UCC" or "UCA" or "UCG"    => "Serine",
            "UAU" or "UAC"                      => "Tyrosine",
            "UGU" or "UGC"                      => "Cysteine",
            "UGG"                               => "Tryptophan",
            _                                   => throw new ArgumentOutOfRangeException(),
        });
}