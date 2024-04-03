using System;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{

    private const int CodonLength = 3;
    public static string[] Proteins(string strand) =>
        strand.ToProteins().ToArray();

    private static IEnumerable<string> ToProteins(this string strand)
    {
        for (var idx = 0; idx < strand.Length; idx += CodonLength)
        {
            var protein = ToProtein(strand[idx..(idx + CodonLength)]);
            if (protein == "STOP")
                yield break;
            yield return protein;
        }
    }

    private static string ToProtein(string codon) =>
        codon switch
        {
            "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
            "UAA" or "UAG" or "UGA" => "STOP",
            "UUU" or "UUC" => "Phenylalanine",
            "UUA" or "UUG" => "Leucine",
            "UAU" or "UAC" => "Tyrosine",
            "UGU" or "UGC" => "Cysteine",
            "AUG" => "Methionine",
            "UGG" => "Tryptophan",
            _ => throw new ArgumentOutOfRangeException(codon),
        };
}