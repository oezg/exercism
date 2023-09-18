using System;
using System.Linq;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        var letters = input.ToCharArray();
        Array.Reverse(letters);
        return new string(letters);
    }


    public static string Reverse2(string input)
        => new(input.Reverse().ToArray());


    public static string Reverse1(string input)
    {
        var result = new char[input.Length];
        for (int i = 0; i < input.Length; i++)
        {
            result[i] = input[^(i + 1)];
        }
        return new string(result);
    }
}