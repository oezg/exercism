using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    private List<int> _scoresList { get; }

    public HighScores(List<int> list) => _scoresList = list;

    public List<int> Scores() => _scoresList;

    public int Latest() => _scoresList.Last();

    public int PersonalBest() => _scoresList.Max();

    public List<int> PersonalTopThree()
        => _scoresList.OrderDescending().Take(3).ToList();
}