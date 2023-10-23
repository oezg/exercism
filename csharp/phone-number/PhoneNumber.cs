using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class PhoneNumber
{
    // To simplify the regex, first remove every non numeric character and leading 1.
    public static string Clean(string phoneNumber)
    {
        phoneNumber = new string(phoneNumber
            .Where(char.IsNumber)
            .SkipWhile(c => c == '1')
            .ToArray());

        string pattern = @"^[2-9]\d{2}[2-9]\d{6}$";
        
        var m = Regex.Match(phoneNumber, pattern);
        
        if (!m.Success)
        {
            throw new ArgumentException($"{phoneNumber} is not a phone number.");
        }
        
        return m.Value;
    }

    public static string Clean1(string phoneNumber)
    {
        // This is a complex regex, but it does what it should.
        string pattern = @"^\+?1?\s*\(?([2-9]\d{2})\)?\s*\W?\s*([2-9]\d{2})\s*\W?\s*(\d{4})\s*$";

        var m = Regex.Match(phoneNumber, pattern);
        
        if (m.Success)
        {
            return m.Groups[1].Value + m.Groups[2].Value + m.Groups[3].Value;
        }
        
        throw new ArgumentException();
    }
}