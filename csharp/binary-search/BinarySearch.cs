using System;

public static class BinarySearch
{
    public static int Find(int[] input, int value)
    {
        int upper = input.Length;
        int lower = 0;
        int middle = upper / 2;
        while(lower < upper)
        {
            middle = lower + (upper - lower) / 2;
            if (input[middle] == value)
            {
                return middle;
            }
            else if (input[middle] > value)
            {
                upper = middle;
            }
            else
            {
                lower = middle + 1;
            }
        }
        return -1;
    }
}