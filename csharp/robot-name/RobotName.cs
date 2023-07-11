using System;
using System.Collections.Generic;

public class Robot
{
    public string Name
    {
        get
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
    }

    public void Reset()
    {
        Name = Name;
    }
}