using System;
using System.Linq;

public static class ResistorColorDuo
{
    private enum Color
    {
        Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White,
    }

    public static int Value(string[] colors)
        => 10 * calculateValue(colors[0]) + calculateValue(colors[1]);

    private static int calculateValue(string color)
        => Enum.TryParse(color.Capitalize(), out Color c) ? (int)c : 0;

    private static string Capitalize(this string str)
        => string.IsNullOrEmpty(str) ? str : char.ToUpper(str[0]) + str[1..];
}
