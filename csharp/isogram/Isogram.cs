using System;
using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        // get the number of bits in the bitfield
        var numLetters = 'z' - 'a' + 1;

        // get the number which has numLetters binary digits all set
        var bitfield = (1 << numLetters) - 1;

        // iterate through the characters in the word
        foreach (var item in word)
        {
            // make a copy of the foreach iteration variable
            var copyItem = item;

            // return false only if the character is a letter
            if (char.IsLetter(item))
            {

                // if the character is upper case turn it into lower case
                if (char.IsUpper(item))
                {
                    copyItem = char.ToLower(item);
                }

                // get the position of the letter in the bitfield
                var digit = 'z' - copyItem;


                // get the bitfield with only that letter set
                var controlNumber = 1 << digit;

                // check if that position is already reset
                if ((bitfield & controlNumber) == 0)
                {
                    // this means the letter occurs more than once
                    return false;
                }
                // else reset the corresponding position in the bitfield
                else
                {
                    bitfield ^= controlNumber;
                }
            }
        }

        // when there are no letters or all the letters occur once 
        return true;

    }


    public static bool IsIsogram3(string word)
    {
        var letters = word.Where(char.IsLetter);
        return letters.Count() == letters.DistinctBy(char.ToLower).Count();
    }


    public static bool IsIsogram2(string word)
        => word
        .ToLowerInvariant()
        .Where(char.IsLetter)
        .GroupBy(c => c)
        .All(g => g.Count() == 1);


    public static bool IsIsogram1(string word)
    {
        for (int i = 0; i < word.Length; i++)
        {
            if (char.IsLetter(word, i) && word[(i + 1)..].ToLower().Contains(word[i], StringComparison.OrdinalIgnoreCase))
                return false;
        }
        return true;
    }
}
