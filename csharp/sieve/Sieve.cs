using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;

public static class Sieve
{
    public static IEnumerable<int> Primes(int limit)
    {
        if (limit < 0)
            throw new ArgumentOutOfRangeException(nameof(limit));

        var primes = new BitArray(limit + 1, true);

        for (var i = 2; i < primes.Length; i++)
        {
            if (!primes[i])
                continue;

            for (var j = i * 2; j < primes.Length; j += i)
                primes[j] = false;

            yield return i;
        }
    }
}
