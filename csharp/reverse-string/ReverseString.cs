using System;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        var result = new char[input.Length];
        for (int i = 0; i < input.Length; i++)
        {
            result[i] = input[^(i + 1)];
        }
        return new string(result);
    }
}