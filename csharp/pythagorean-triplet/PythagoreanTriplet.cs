using System;
using System.Collections.Generic;

public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        if (sum < 12)
        {
            yield break;
        }

        foreach (var pair in EuclideanRootsWitSum(sum))
        {
            var a = pair.m * pair.m - pair.n * pair.n;
            var b = 2 * pair.m * pair.n;
            var c = pair.m * pair.m + pair.n * pair.n;
            (a, b) = (Math.Min(a, b), Math.Max(a, b));
            verify(a, b, c, sum);
            yield return (a, b, c);
        }
    }

    private static void verify(int a, int b, int c, int sum)
    {
        if (sum != a + b + c)
        {
            throw new Exception("Sum rule!");
        }
        if (a * a + b * b != c * c)
        {
            throw new Exception("hypotenuse rule!");
        }
        if (a > b)
        {
            throw new Exception("order rule!");
        }
    }

    public static IEnumerable<(int m, int n)> EuclideanRootsWitSum(int sum)
    {
        if ((sum & 1) == 1)
        {
            yield break;
        }
        sum >>= 1;
        for (int m = 2; m < Math.Sqrt(sum); m++)
        {
            for (int n = 1; n < m; n++)
            {
                if (m % 2 == 1 && n % 2 == 1)
                {
                    continue;
                }
                if (m * (m + n) == sum)
                {
                    yield return (m, n);
                }
            }
        }
    }
}