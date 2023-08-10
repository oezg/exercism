using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class LargestSeriesProduct
{
    public static long GetLargestProduct(string digits, int span) 
    {
        if (digits.Length == 0 && span == 0)
        {
            return 0;
        }
        s_throwArgumentException(digits, span);
        var maxi = 0L;
        for (int i = 0; i < digits.Length - span + 1; i++)
        {
            var prod = digits
                .Substring(i, span)
                .Select(n => n - '0')
                .Aggregate(1, (a, b) => a * b);
            if (prod > maxi) 
                maxi = prod;
        }
        return maxi;
    }

    private static void s_throwArgumentException(string digits, int span)
    {
        if (digits.Length - span < 0)
        {
            throw new ArgumentException("span must be less than or equal to length of digits");
        }
        else if (digits.Length == 0)
        {
            throw new ArgumentException("digits cannot be ampty");
        }
        else if (span < 1)
        {
            throw new ArgumentException("span must be positive");
        }
        else if (Regex.IsMatch(digits, @"\D"))
        {
            throw new ArgumentException("digits must contain only digits");
        }
    }
}