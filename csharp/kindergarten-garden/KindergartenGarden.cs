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
    public KindergartenGarden(string diagram)
    {
        string[] rows = diagram.Split('\n');
        _plants = new Plant[rows.Length, rows[0].Length];
        for (int i = 0; i < rows.Length; i++)
        {
            for (int j = 0; j < rows[i].Length; j++)
            {
                _plants[i,j] = (Plant)rows[i][j];
            }
        }
    }

    private Plant[,] _plants { get; }

    public IEnumerable<Plant> Plants(string student)
    {
        int n = 2 * (student[0] - 'A');
        return new Plant[] { _plants[0, n], _plants[0, n+1], _plants[1, n], _plants[1, n+1] };
    }
}