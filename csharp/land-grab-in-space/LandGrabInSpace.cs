using System;
using System.Collections.Generic;
using System.Linq;

public struct Coord
{
    public Coord(ushort x, ushort y)
    {
        X = x;
        Y = y;
    }

    public ushort X { get; }
    public ushort Y { get; }

    public readonly bool Equals(Coord other) 
        => X == other.X && Y == other.Y;

    public readonly double SideLength(Coord other) 
        => Math.Sqrt(Math.Pow((X - other.X), 2) + Math.Pow((Y - other.Y), 2));
}

public struct Plot
{
    public Plot(Coord coord1, Coord coord2, Coord coord3, Coord coord4) 
        => Coords = new Coord[] { coord1, coord2, coord3, coord4 };

    public Coord[] Coords { get; }

    public readonly bool Equals(Plot p)
    {
        for (int i = 0; i < Coords.Length; i++)
        {
            if (Coords[i].Equals(p.Coords[i]))
            {
                continue;
            }
            return false;
        }
        return true;
    }

    public readonly double[] SideLengths
    {
        get
        {
            var sideLengths = new double[Coords.Length];
            for (int i = 0; i < sideLengths.Length; i++)
            {
                var nextCoord = Coords[(i + 1) % Coords.Length];
                var sideLength = Coords[i].SideLength(nextCoord);
                sideLengths[i] = sideLength;
            }
            return sideLengths;
        }
    }

    public readonly double LongestSide => SideLengths.Max();
}


public class ClaimsHandler
{
    public List<Plot> Plots { get; } = new List<Plot>();

    public void StakeClaim(Plot plot)
    {
        if (!IsClaimStaked(plot))
        {
            Plots.Add(plot);
        }
    }

    public bool IsClaimStaked(Plot plot)
    {
        foreach (var item in Plots)
        {
            if (plot.Equals(item))
            {
                return true;
            }
        }
        return false;
    }

    public bool IsLastClaim(Plot plot)
        => Plots.Count != 0 && plot.Equals(Plots[^1]);

    public Plot GetClaimWithLongestSide() 
        => Plots.OrderByDescending(x => x.LongestSide).FirstOrDefault();
}
