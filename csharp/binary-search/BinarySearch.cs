using System;

public static class BinarySearch
{
    public static int Find(int[] input, int value)
    {
        int lower = 0, upper = input.Length, middle;
        while(lower < upper)
        {
            middle = (upper + lower) / 2;
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