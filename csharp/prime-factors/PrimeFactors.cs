using System;
using System.Collections.Generic;

public static class PrimeFactors
{
    public static long[] Factors(long number)
    {
        var result = new List<long>();
        if (number < 2)
        {
            return result.ToArray();
        }

        long upperBound = (long)Math.Sqrt(number) + 1;

        long[] primes = SieveEratosthenes(upperBound);

        foreach (long prime in primes)
        {
            while (number % prime == 0)
            {
                number /= prime;
                result.Add(prime);
            }
        }

        if (number > 1)
        {
            result.Add(number);
        }

        return result.ToArray();
    }

    public static long[] SieveEratosthenes(long upperBound)
    {
        bool[] sieve;
        sieve = new bool[upperBound];
        for (int i = 2;  i < upperBound; i++)
        {
            sieve[i] = true;
        }
        int count;
        count = 0;
        for (int i = 2;i < upperBound; i++)
        {
            if (sieve[i]) {
                count++;
                for (int j = i + i;  j < upperBound; j += i) {
                    sieve[j] = false;
                }
            }
        }
        long[] result = new long[count];
        count = 0;
        for (var i = 0; i < upperBound; i++)
        {
            if (sieve[i])
            {
                result[count] = i;
                count++;
            }
        }
        return result;
    }
}