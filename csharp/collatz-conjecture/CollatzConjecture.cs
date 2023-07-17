using System;

public static class CollatzConjecture
{
    public static int Steps(int number, int count = 0)
        => number == 1 ? count
        : number < 1 ? throw new ArgumentOutOfRangeException(nameof(number))
        : number % 2 == 0 ? Steps(number / 2, ++count)
        : Steps(number * 3 + 1, ++count);
}