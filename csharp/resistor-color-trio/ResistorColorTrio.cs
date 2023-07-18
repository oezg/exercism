using System;
using System.ComponentModel;
using System.Data;

public static class ResistorColorTrio
{
    public static string Label(string[] colors)
    {
        if (colors.Length < 3) throw new ArgumentException();
        int exponent = GetColorValue(colors[2]);
        int value = 10 * GetColorValue(colors[0]);
        value += GetColorValue(colors[1]);
        value *= (int)(Math.Pow(10, exponent));
        string prefix = GetPrefix(ref value);
        return $"{value} {prefix}ohms";
    }

    private static int GetColorValue(string color)
        => color switch
        {
            "black" => 0,
            "brown" => 1,
            "red" => 2,
            "orange" => 3,
            "yellow" => 4,
            "green" => 5,
            "blue" => 6,
            "violet" => 7,
            "grey" => 8,
            "white" => 9,
            _ => throw new ArgumentException(),
        };

    private static string GetPrefix(ref int x)
    {
        if (x < 1000) return "";
        x /= 1000;
        return "kilo";
    }
}
