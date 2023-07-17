using System;
using System.Text.RegularExpressions;

public class PhoneNumber
{
    public static string Clean(string phoneNumber)
    {
        string pattern = @"^\+?1?\s*\(?([2-9]\d{2})\)?\s*\W?\s*([2-9]\d{2})\s*\W?\s*(\d{4})\s*$";
        var m = Regex.Match(phoneNumber, pattern);
        if (m.Success)
        {
            return m.Groups[1].Value + m.Groups[2].Value + m.Groups[3].Value;
        }
        throw new ArgumentException();
    }
}