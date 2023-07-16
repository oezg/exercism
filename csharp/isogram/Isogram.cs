using System;
using System.Linq;
using System.Threading.Channels;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        for (int i = 0; i < word.Length; i++)
        {
            if (char.IsLetter(word, i) && word.Substring(i + 1).ToLower().Contains(word[i], StringComparison.OrdinalIgnoreCase))
                return false;
        }
        return true;
    }
}
