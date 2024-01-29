using System;
using System.Linq;

public static class BeerSong
{
    public static string Recite(int startBottles, int takeDown)       
        => string.Join("\n\n",
            Enumerable.Range(startBottles - takeDown + 1, takeDown)
            .Reverse()
            .Select(formatStrophe)
        );

    private static string formatStrophe(int count)
        => string.Join('\n',
            firstLine(bottles(count)),
            secondLine(takeOrBuy(count), bottles(count - 1))
        );

    private static string firstLine(string bottles)
        => $"{capitalize(bottles)} on the wall, {bottles}.";

    private static string secondLine(string takeOrBuy, string bottles)
        => $"{takeOrBuy}, {bottles} on the wall.";

    private static string bottles(int count)
        => $"{howMany(count)} {beer(count)}";

    private static string beer(int count)
        => $"bottle{s(count)} of beer";

    private static string howMany(int count) 
        => count == 0 ? "no more" : ((count % 100 + 100) % 100).ToString();

    private static string s(int count)
        => count == 1 ? "" : "s";

    private static string takeOrBuy(int count)
        => count == 0 ? "Go to the store and buy some more" : $"Take {it(count)} down and pass it around";

    private static string it(int count)
        => count == 1 ? "it" : "one";

    private static string capitalize(string str)
        => string.Concat(str[..1].ToUpperInvariant(), str[1..]);
}