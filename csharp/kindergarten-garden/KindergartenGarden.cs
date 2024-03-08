using System;
using System.Collections.Generic;
using System.Linq;

public enum Plant
{
    Violets = 'V',
    Radishes = 'R',
    Clover = 'C',
    Grass = 'G'
}

public class KindergartenGarden
{
    private readonly IEnumerable<Plant> _plants;
    private static readonly string[] _studentNames = {
        "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"
    };

    public KindergartenGarden(string diagram) => 
        _plants = diagram.Where(c => Enum.IsDefined(typeof(Plant), (int)c)).Select(c => (Plant)c);

    public IEnumerable<Plant> Plants(string student)
    {
        int n = 2 * Array.IndexOf(_studentNames, student);
        return _plants.Skip(n).Take(2).Concat(_plants.Skip(n + _plants.Count() / 2).Take(2));
    }
}
