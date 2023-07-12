using System;
using System.Collections.Generic;

public static class MatchingBrackets
{
    public static bool IsPaired(string input)
    {
        Dictionary<char, char> bracketPairs = new() 
        {
            [')'] = '(',
            [']'] = '[',
            ['}'] = '{',
        };
        LinkedList<char> brackets = new LinkedList<char>();
        foreach (char chr in input)
        {
            if ("([{".Contains(chr))
            {
                brackets.AddLast(chr);
            }
            else if (")]}".Contains(chr)) 
            {
                if (brackets.Count > 0 && brackets.Last.Value == bracketPairs[chr])
                {
                    brackets.RemoveLast();
                }
                else
                {
                    return false;
                }
            }
        }
        return brackets.Count == 0;
    }
}
