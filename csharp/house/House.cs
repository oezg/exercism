using System;
using System.Collections.Generic;
using System.Linq;

public static class House
{
    // static dictionary to map verse numbers to strings
    private static Dictionary<int, string> s_verses = new Dictionary<int, string>
    {
        {0, "This is" },
        {1, "the house that Jack built" },
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

    // Recursive method takes an optional second argument to accumulate strings
    public static string Recite(int verseNumber, string str = "") 
        => verseNumber == 1
            ? $"{s_verses[0]} {str}{s_verses[1]}."
            : Recite(verseNumber - 1, $"{str}{s_verses[verseNumber]} ");

    // Iterative linq method joins strings
    public static string Recite(int verseNumber)
        => $"{s_verses[0]} {string.Join(' ', Enumerable.Range(1, verseNumber).Reverse().Select(n => s_verses[n]))}.";

    public static string Recite(int startVerse, int endVerse)
        => string.Join('\n', Enumerable.Range(startVerse, endVerse - startVerse + 1).Select(n => Recite(n)));
}