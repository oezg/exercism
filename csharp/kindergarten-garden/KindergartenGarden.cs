using System;
using System.Collections.Generic;

public enum Plant
{
    Violets = 'V',
    Radishes = 'R',
    Clover = 'C',
    Grass = 'G'
}

public class KindergartenGarden
{
    private string[] _strings;

    public KindergartenGarden(string diagram)
    {
        _strings = diagram.Split('\n');
    }

    public IEnumerable<Plant> Plants(string student)
    {
        int n = student[0] - 'A';
        return new Plant[] { (Plant)_strings[0][n * 2], (Plant)_strings[0][n * 2 + 1], (Plant)_strings[1][n * 2], (Plant)_strings[1][n * 2 + 1] };
    }
}