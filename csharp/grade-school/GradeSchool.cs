using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;

public struct Student : IEquatable<Student>, IComparable<Student>
{
    public string Name;
    public int Grade;

    public Student(string name, int grade) : this()
    {
        Name = name;
        Grade = grade;
    }

    public int CompareTo(Student other) 
        => Grade == other.Grade 
        ? Name.CompareTo(other.Name) 
        : Grade - other.Grade;

    public bool Equals(Student other) => Name == other.Name;
}

public class GradeSchool
{
    private List<Student> _students { get; } = new();

    public bool Add(string name, int grade)
    {
        Student student = new Student(name, grade);
        if (_students.Contains(student))
        {
            return false;
        }
        _students.Add(student);
        return true;
    }

    public IEnumerable<string> Roster()
        => _students.Order().Select(s => s.Name);

    public IEnumerable<string> Grade(int grade) 
        => _students.Where(s => s.Grade == grade).Select(s => s.Name).Order();
}