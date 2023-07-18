using System;
using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        HashSet<int> result = new HashSet<int>();
        foreach (int multiple in multiples)
        {
            for (int i = 1; multiple > 0 && i * multiple < max; i++)
            {
                result.Add(i * multiple);
            }
        }
        return result.Sum();
    }
}