using System.Collections.Generic;
using System.Linq;

public static class House
{
    // Map verse numbers to strings
    private static readonly Dictionary<int, string> s_verses = new()
    {
        {1, "the house that Jack built." },
        {2, "the malt that lay in" },
        {3, "the rat that ate" },
        {4, "the cat that killed" },
        {5, "the dog that worried" },
        {6, "the cow with the crumpled horn that tossed" },
        {7, "the maiden all forlorn that milked" },
        {8, "the man all tattered and torn that kissed" },
        {9, "the priest all shaven and shorn that married" },
        {10, "the rooster that crowed in the morn that woke" },
        {11, "the farmer sowing his corn that kept" },
        {12, "the horse and the hound and the horn that belonged to" },
    };

    public static string Recite(int num) =>
        $"This is {recite(num)}";

    static string recite(int n) =>
        n == 1 ? s_verses[n] : string.Join(' ', s_verses[n], recite(n - 1));

    public static string Recite(int startVerse, int endVerse)
        => string.Join('\n', Enumerable.Range(startVerse, endVerse - startVerse + 1).Select(n => Recite(n)));
}