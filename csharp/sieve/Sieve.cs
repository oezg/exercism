using System;
using System.Collections.Generic;
using System.Linq;

public static class Sieve
{
    public static int[] Primes(int limit)
    {
        var candidates = Enumerable.Range(2, limit - 1).ToArray();
        var visited = new bool[candidates.Length];
        var primes = new List<int>();
        for (int i = 0; i < candidates.Length; i++)
        {
            if (visited[i]) continue;
            primes.Add(candidates[i]);
            for (int j = i; j < candidates.Length; j += candidates[i])
            {
                visited[j] = true;
            }
        }
        return primes.ToArray();
    }
}