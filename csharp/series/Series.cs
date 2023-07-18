using System;
using System.Linq;

public static class Series
{
    public static string[] Slices(string numbers, int sliceLength) 
        => sliceLength > 0 && sliceLength <= numbers.Length
            ? Enumerable.Range(0, numbers.Length - sliceLength + 1)
            .Select(i => numbers[i..(i + sliceLength)]).ToArray()
            : throw new ArgumentException();
}