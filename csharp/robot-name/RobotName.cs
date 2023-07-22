using System;
using System.Collections.Generic;
using System.Linq;

public class Robot
{
    private static readonly HashSet<string> s_names = new HashSet<string>();

    public string Name { get; private set; }
    public Robot() 
    {
        Reset();
    }

    public void Reset()
    {
        Name = GenerateNewName();
    }

    private static string GenerateName()
    {
        var random = new Random();
        return string.Join("", Enumerable.Range(0, 5).Select(n => n < 2 ? random.Next('A', 'Z' + 1) : '0' + random.Next(10)).Select(n => (char)n));
    }

    private static string GenerateNewName()
    {
        string name = GenerateName();
        while (s_names.Contains(name))
        {
            name = GenerateName();
        }
        s_names.Add(name);
        return name;
    }
}