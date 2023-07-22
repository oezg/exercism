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

    public readonly double SideLength(Coord other) 
        => Math.Sqrt(Math.Pow((X - other.X), 2) + Math.Pow((Y - other.Y), 2));
}

public struct Plot
{
    private readonly Coord _coord1, _coord2, _coord3, _coord4;
    public Plot(Coord coord1, Coord coord2, Coord coord3, Coord coord4)
    {
        _coord1 = coord1;
        _coord2 = coord2;
        _coord3 = coord3;
        _coord4 = coord4;
    }

    public readonly double LongestSide 
        => new Coord[] { _coord1, _coord2, _coord3, _coord4 }
        .Zip(new Coord[] { _coord4, _coord1, _coord2, _coord3 })
        .Select(pair => pair.First.SideLength(pair.Second))
        .Max();
}


public class ClaimsHandler
{
    private HashSet<Plot> _plots { get; } = new();
    private Plot _lastClaim { get; set; }

    public void StakeClaim(Plot plot)
    {
        if (_plots.Add(plot))
        {
            _lastClaim = plot;
        }
    }

    public bool IsClaimStaked(Plot plot)
        => _plots.Contains(plot);

    public bool IsLastClaim(Plot plot)
        =>  plot.Equals(_lastClaim);

    public Plot GetClaimWithLongestSide() 
        => _plots.MaxBy(p => p.LongestSide);
}
