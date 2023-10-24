using System;
using System.Collections.Generic;
using System.Linq;

public static class ScrabbleScore
{
    // If there are many operations a Dictionary lookup should be faster than
    // descending down a switch.
    private static Dictionary<char, int> s_scores;

    // A static constructor is used to populate a Dictionary.
    // It transforms an initial Dictionary from <int, string> to <char, int>. 
    static ScrabbleScore()
    {
        var dict = new Dictionary<int, string>
        {
            { 1, "A, E, I, O, U, L, N, R, S, T" },
            { 2, "D, G" },
            { 3, "B, C, M, P"},
            { 4, "F, H, V, W, Y" },
            { 5, "K" },
            { 8, "J, X" },
            { 10, "Q, Z"},
        };

        s_scores = new Dictionary<char, int>();

        // An outer foreach on the KeyValuePairs is used with an inner foreach
        // on ToCharArray of the value. 
        foreach (var keyValuePair in dict)
        {
            // The inner foreach would Add the character as the key
            // and the old key as the value for the new Dictionary.
            foreach (var character in keyValuePair.Value.Replace(", ", "").ToCharArray())
            {
                s_scores.Add(character, keyValuePair.Key);
            }
        }
    }

    // A switch is probably more performant than a Dictionary for a small amount of
    // operations, since it takes a while to construct a Dictionary.
    public static int LetterValue(char letter)
        => letter switch
        {
            'A' or 'E' or 'I' or 'O' or 'U' or 'L' or 'N' or 'R' or 'S' or 'T' => 1,
            'D' or'G'                                                          => 2,
            'B' or 'C' or 'M' or'P'                                            => 3,
            'F' or'H' or 'V' or 'W' or 'Y'                                     => 4,
            'K'                                                                => 5,
            'J' or 'X'                                                         => 8,
            'Q' or 'Z'                                                         => 10,
            _                                                                  => 0,
        };

    public static int Score1(string input) 
        => input.ToUpper().ToCharArray().Sum(LetterValue);

    public static int Score(string input)
        => input.ToUpper().ToCharArray().Sum(c => s_scores[c]);
}