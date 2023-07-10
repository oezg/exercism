using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    public List<int> ScoresList { get; }

    public HighScores(List<int> list) => ScoresList = list;

    public List<int> Scores() => ScoresList;

    public int Latest() => ScoresList[^1];

    public int PersonalBest() => ScoresList.Max();

    public List<int> PersonalTopThree()
    {
        var result = ScoresList.GetRange(0, ScoresList.Count);
        result.Sort();
        result.Reverse();
        int count = Math.Min(3, result.Count);
        return result.GetRange(0, count);
    }
}