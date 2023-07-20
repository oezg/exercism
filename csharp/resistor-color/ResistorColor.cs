using System;

public static class ResistorColor
{
    private static readonly string[] s_colors = new[] { "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" };
    public static int ColorCode(string color) => Array.IndexOf(s_colors, color);

    public static string[] Colors() => s_colors;
}