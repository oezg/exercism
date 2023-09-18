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

        foreach (var root in EuclideanRootsWitSum(sum))
        {
            yield return (root.ShortestSide, root.MiddleSide, root.Hypotenuse);
        }
    }

    public readonly struct Root : IEquatable<Root>, IComparable<Root>
    {
        internal int K { get; init; }

        internal int M { get; init; }

        internal int N { get; init; }
        
        private readonly int _sideA => K * (M * M - N * N);

        private readonly int _sideB => 2 * K * M * N;

        public readonly int ShortestSide => _sideA < _sideB ? _sideA : _sideB;

        public readonly int MiddleSide => _sideA < _sideB ? _sideB : _sideA;

        public readonly int Hypotenuse => K * (M * M + N * N);

        public readonly int CompareTo(Root other) => ShortestSide - other.ShortestSide;

        public readonly bool Equals(Root other) => Hypotenuse == other.Hypotenuse;
    }

    public static SortedSet<Root> EuclideanRootsWitSum(int sum)
    {
        var roots = new SortedSet<Root>();

        if ((sum & 1) == 1)
        {
            return roots;
        }

        sum >>= 1;
        
        for (int m = 2; m < Math.Sqrt(sum); m++)
        {
            for (int n = 1; n < m; n++)
            {
                if ((m & 1) + (n & 1) == 2)
                {
                    continue;
                }
                
                if (sum % (m * (m + n)) == 0)
                {
                    var k = sum / (m * (m + n));
                    
                    roots.Add(new Root { K = k, M = m, N = n});
                }
            }
        }

        return roots;
    }
}