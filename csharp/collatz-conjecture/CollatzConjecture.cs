using System;
using System.Collections.Generic;
using System.Linq;

public static class CollatzConjecture
{
    // Using lazy iteration with IEnumerable interface 
    public static int Steps(int number)
    {
        if (number < 1) throw new ArgumentOutOfRangeException(nameof(number));

        return Sequence(number).Count();
    }


    // Combine Recursive and Sequence approaches, rather Sequence approach with recursive sequence
    // Although this is a sequence approach using IEnumerable interface, no yield return is needed
    // Initialize sequence if it is not provided, i.e. the first call
    // This is a workaround because C# does not allow non constant values as default values
    public static IEnumerable<int> Sequence(int number, IEnumerable<int> sequence = null) 
        => number switch
        {
            > 1 => Sequence(number switch
            {
                _ when number % 2 == 0 => number / 2,
                _ => number * 3 + 1
            }, (sequence ?? Enumerable.Empty<int>()).Append(number)),
            _ => sequence ?? Enumerable.Empty<int>()
        };


    // Using yield return in the while loop for the lazy iteration logic
    public static IEnumerable<int> Sequence1(int number)
    {
        while (number > 1)
        {
            number = number % 2 == 0 ? number / 2 : number * 3 + 1;
            yield return number;
        }
    }


    // Recursive approach using switch to make the logic more readable
    public static int Steps2(int number, int count = 0)
        => number switch 
        { 
            < 1 => throw new ArgumentOutOfRangeException(nameof(number)),
            1 => count,
            _ when number % 2 == 0 => Steps2(number/ 2, count + 1),
            _ => Steps2(number * 3 + 1, count + 1)
        };


    // Recursive approach with ternary operator is not very readable
    public static int Steps1(int number, int count = 0)
        => number == 1 ? count
        : number < 1 ? throw new ArgumentOutOfRangeException(nameof(number))
        : number % 2 == 0 ? Steps1(number / 2, ++count)
        : Steps1(number * 3 + 1, ++count);
}