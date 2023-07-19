using System;
using System.Linq;

public static class BeerSong
{
    public static string Recite(int startBottles, int takeDown)
        => Enumerable.Range(startBottles - takeDown + 1, takeDown).Reverse()
        .Select(i => @$"{(i == 0 ? "No more" : i)} bottle{(i != 1 ? "s" : "")} of beer on the wall, {(i == 0 ? "no more" : i)} bottle{(i != 1 ? "s" : "")} of beer.
{(i == 0 ? "Go to the store and buy some more" : $"Take {(i == 1 ? "it" : "one")} down and pass it around")}, {(i == 1 ? "no more" : i == 0 ? "99" : i - 1)} bottle{(i != 2 ? "s" : "")} of beer on the wall.")
        .Aggregate((a, b) => a + "\n\n" + b);
}