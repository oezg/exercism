using System;
using System.Collections.Generic;
using System.Linq;

public static class AllYourBase
{
    public static int[] Rebase(int inputBase, int[] inputDigits, int outputBase)
    {
        var result = 0;
        var numDigits = inputDigits.Length;
        for (int i = 0; i < numDigits; i++)
        {
            result += inputDigits[i] * (int)(Math.Pow(inputBase, numDigits - 1 - i));
        }
        var output = new LinkedList<int>();
        while (result > 0)
        {
            output.AddFirst(result % outputBase);
            result /= outputBase;
        }
        return output.ToArray();
    }
}
