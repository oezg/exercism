using System;

public static class Raindrops
{
    public static string Convert(int number)
    {
        string result = string.Empty;
        if (number % 3 == 0) 
        {
            result += "Pling";
        }
        if (number % 5 == 0)
        {
            result += "Plang";
        }
        if (number % 7 == 0)
        {
            result += "Plong";
        }
        return string.IsNullOrEmpty(result) ? number.ToString() : result;
    }
}