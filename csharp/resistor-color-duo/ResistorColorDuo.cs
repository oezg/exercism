using System;
using System.Collections.Generic;
using System.Linq;

public static class ResistorColorDuo
{
    private enum Color
    {
        black, brown, red, orange, yellow, green, blue, violet, grey, white,
    }

    private static readonly Dictionary<string, int> _colorValues;

    static ResistorColorDuo() 
        => _colorValues = ((Color[])Enum.GetValues(typeof(Color)))
        .ToDictionary(color => color.ToString(), color => (int)color);

    public static int Value(string[] colors)
        => 10 * _colorValues[colors[0]] + _colorValues[colors[1]];

}
