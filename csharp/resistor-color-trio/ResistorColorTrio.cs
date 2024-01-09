using System;
using System.Collections.Generic;

public static class ResistorColorTrio
{
    private const int KILO = 1000;
    private static readonly IReadOnlyDictionary<string, int> s_resistorColors;
    static ResistorColorTrio() => s_resistorColors = new Dictionary<string, int>()
    {
        ["black"] = 0,
        ["brown"] = 1,
        ["red"] = 2,
        ["orange"] = 3,
        ["yellow"] = 4,
        ["green"] = 5,
        ["blue"] = 6,
        ["violet"] = 7,
        ["grey"] = 8,
        ["white"] = 9,
    };

    public static string Label(string[] colors)
    {
        if (colors == null || colors.Length != 3)
            throw new ArgumentException($"{nameof(colors)} does not have 3 resistanceValues.");
            
        var resistanceValue = CalculateResistance(ResistanceValues(colors));
        (string prefix, resistanceValue) = resistanceValue > KILO 
            ? ("kilo", resistanceValue / KILO) 
            : (string.Empty, resistanceValue);

        return $"{resistanceValue} {prefix}ohms";
    }

    private static int[] ResistanceValues(string[] colors)
    {
        int[] resistanceValues = new int[colors.Length];
        for (int i = 0; i < colors.Length; i++)
            if (!s_resistorColors.TryGetValue(colors[i], out resistanceValues[i]))
                throw new ArgumentException($"'{colors[i]}' is not a resistor color.");

        return resistanceValues;
    }

    private static int CalculateResistance(int[] resistanceValues) 
        => (resistanceValues[0] * 10 + resistanceValues[1]) * (int)Math.Pow(10, resistanceValues[2]);
}
