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
    IEnumerable<Plant> Garden;
    string[] Students = { "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry" };

    public KindergartenGarden(string diagram) =>
        Garden = diagram.Where(c => Enum.IsDefined(typeof(Plant), (int)c)).Select(c => (Plant)c);

    public IEnumerable<Plant> Plants(string student)
    {
        int n = 2 * Array.IndexOf(Students, student);
        return Garden.Skip(n).Take(2).Concat(Garden.Skip(n + Garden.Count() / 2).Take(2));
    }
}
