using System;
using System.Collections.Generic;
using System.Linq;

public static class MatchingBrackets
{
    public static bool IsPaired(string input)
    {
        Stack<char> stack = new();
        foreach (char bracket in input.Where("()[]{}<>".Contains))
        {
            if ("([{<".Contains(bracket))
            {
                stack.Push(ClosingPair(bracket));
            }
            else if (stack.Count == 0 || bracket != stack.Pop())
            {
                return false;
            }
        }
        return stack.Count == 0;
    }

    public static char ClosingPair(char openingBracket)
        => openingBracket switch
        {
            '(' => ')',
            '[' => ']',
            '{' => '}',
            '<' => '>',
            _ => throw new ArgumentOutOfRangeException(openingBracket + " must be '(', '[', '{' or '<'.")
        };
}
