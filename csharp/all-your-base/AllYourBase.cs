using System;
using System.Collections.Generic;
using System.Linq;

public static class AllYourBase
{
    public static int[] Rebase(int inputBase, int[] inputDigits, int outputBase)
    {
        ThrowExceptions(inputBase, inputDigits, outputBase);

        var result = Enumerable.Range(0, inputDigits.Length)
            .Zip(inputDigits)
            .Select(pair => pair.Second * (int)Math.Pow(inputBase, inputDigits.Length - 1 - pair.First))
            .Sum();
        
        if (result == 0) return new int[1] {0};
        
        var output = new LinkedList<int>();
        while (result > 0)
        {
            output.AddFirst(result % outputBase);
            result /= outputBase;
        }
        return output.ToArray();
    }

    public static void ThrowExceptions(int inputBase, int[] inputDigits, int outputBase)
    {
        if (inputBase < 2 || outputBase < 2) 
            throw new ArgumentException("base can not be less than 2");
        if (inputDigits.Any(digit => digit < 0 || digit >= inputBase))
            throw new ArgumentException($"one of digits is not between 0 and {inputBase}");
    }
}
