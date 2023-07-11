using System;
using System.Collections.Generic;

public class Robot
{
    private static HashSet<string> names = new HashSet<string>();

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
        string name = "";
        var random = new Random();
        name += (char)(random.Next('A', 'Z' + 1));
        name += (char)(random.Next('A', 'Z' + 1));
        name += random.Next(10);
        name += random.Next(10);
        name += random.Next(10);
        return name;
    }

    private static string GenerateNewName()
    {
        string name = GenerateName();
        while (names.Contains(name))
        {
            name = GenerateName();
        }
        names.Add(name);
        return name;
    }
}