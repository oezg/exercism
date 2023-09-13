using System;
using System.Collections.Generic;
using System.Linq;

public static class PascalsTriangle
{
    public static IEnumerable<IEnumerable<int>> Calculate(int rows)
    {
        if (rows < 0) throw new ArgumentOutOfRangeException("rows cannot be negative");

        var result = Enumerable.Range(0, rows).Select(n => new List<int> { 1 }).ToList();

        for (var i = 1; i < rows; i++) 
        {
            for (var j = 1; j < i; j++)
            {
                result[i].Add(result[i - 1][j-1] + result[i - 1][j]);
            }

            result[i].Add(1);
        }

        return result;
    }

}