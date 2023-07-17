using System;
using System.Collections.Generic;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
        => number <= 0 ? throw new ArgumentOutOfRangeException(nameof(number))
        : number.AliquotSum() == number ? Classification.Perfect
        : number.AliquotSum() > number ? Classification.Abundant
        : Classification.Deficient;


    public static int AliquotSum(this int number) 
        => Enumerable.Range(1, number / 2).Where(n => number % n == 0).Sum();
}
