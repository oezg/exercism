using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;

public class GradeSchool
{
    public Dictionary<int, HashSet<string>> Grades { get; } = new();

    public bool Add(string student, int grade)
    {
        if (Roster().Contains(student))
        {
            return false;
        }
        if (!Grades.ContainsKey(grade))
        {
            Grades[grade] = new HashSet<string>();
        }
        return Grades[grade].Add(student);
    }

    public IEnumerable<string> Roster()
    {
        List<string> roster = new List<string>();
        foreach ( var key in Grades.Keys.ToImmutableSortedSet())
        {
            roster.AddRange(Grades[key].ToImmutableSortedSet());
        }
        return roster;
    }

    public IEnumerable<string> Grade(int grade) => 
        Grades.GetValueOrDefault(grade, new HashSet<string>()).ToImmutableSortedSet();
}