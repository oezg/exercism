using System;
using System.Collections.Generic;

public class CircularBuffer<T>
{
    public T[] Buffer { get; set; }
    
    public int Capacity { get; set; }

    public int Oldest { get; set; } = 0;

    public int NextWrite { get; set; } = 0;

    public bool[] Track { get; set; }

    public CircularBuffer(int capacity)
    {
        Capacity = capacity;
        Clear();
    }

    public T Read()
    {
        if (!Track[Oldest])
        {
            throw new InvalidOperationException();
        }
        T t = Buffer[Oldest];
        Buffer[Oldest] = default(T);
        Track[Oldest] = false;
        Oldest = (Oldest + 1) % Capacity;
        return t;
    }

    public void Write(T value)
    {
        if (Track[NextWrite])
        {
            throw new InvalidOperationException();
        }
        Buffer[NextWrite] = value;
        Track[NextWrite] = true;
        NextWrite = (NextWrite + 1) % Capacity;
    }

    public void Overwrite(T value)
    {
        try
        {
            Write(value);
        }
        catch (InvalidOperationException e)
        {
            Buffer[Oldest] = value;
            Oldest = (Oldest + 1) % Capacity;
        }
    }

    public void Clear()
    {
        Buffer = new T[Capacity];
        Track = new bool[Capacity];
    }
}   