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
    
    //{
    //    var result = _scoresList.GetRange(0, _scoresList.Count);
    //    result.Sort();
    //    result.Reverse();
    //    int count = Math.Min(3, result.Count);
    //    return result.GetRange(0, count);
    //}
}