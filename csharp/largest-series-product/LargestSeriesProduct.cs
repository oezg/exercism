using System;
using System.Linq;

public static class LargestSeriesProduct
{
    public static long GetLargestProduct(string digits, int span)
    {
        if (span < 0 || span > digits.Length)
            throw new ArgumentException("span must be between 0 and the length of digits");

        return digits
            .Select((digit, index) => new { digit, index })
            .Aggregate((product: 0L, series: new int[span]), (acc, current) =>
            {
                if (!Char.IsDigit(current.digit))
                    throw new ArgumentException("digits must contain only digits");

                acc.series[current.index % span] = current.digit - '0';

                acc.product = Math.Max(acc.product, acc.series.Aggregate(1, (a, b) => a * b));

                return acc;
            }, result => result.product);
    }
}