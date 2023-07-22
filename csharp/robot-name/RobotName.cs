using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class Robot
{
    public string Name { get; private set; }

    public Robot() => Reset();

    public void Reset() => Name = NameGenerator.s_nextAvailableRandomName();
}

static class NameGenerator
{
    #region private_bindings
    private static readonly Random s_random = new();
    private static readonly string[] s_allNames = s_generateAllRandomNames();
    private static int s_current = 0;
    #endregion private_bindings

    internal static string s_nextAvailableRandomName()
        => s_allNames[s_current++];

    private static string[] s_generateAllRandomNames()
    {
        var list = new List<string>();
        StringBuilder stringBuilder = new StringBuilder();
        for (char i = 'A'; i <= 'Z'; i++)
        {
            stringBuilder.Append(i);
            for (char j = 'A';  j <= 'Z'; j++)
            {
                stringBuilder.Append(j);
                for (int k = 0; k < 1000; k++)
                {
                    stringBuilder.AppendFormat("{0:D3}", k);
                    list.Add(stringBuilder.ToString());
                    stringBuilder.Length = 2;
                }
                stringBuilder.Length--;
            }
            stringBuilder.Length--;
        }
        return list.OrderBy(s => s_random.Next()).ToArray();
    }
}