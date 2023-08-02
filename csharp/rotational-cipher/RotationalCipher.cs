using System;
using System.Linq;
using System.Text;

public static class RotationalCipher
{
    public static string Rotate(string text, int shiftKey)
        => text.Aggregate("", (cipher, chr) => cipher + chr switch
        {
            <= 'z' and >= 'a' => (char)('a' + ((chr - 'a' + shiftKey) % ('z' - 'a' + 1))),
            <= 'Z' and >= 'A' => (char)('A' + ((chr - 'A' + shiftKey) % ('Z' - 'A' + 1))),
            _ => chr
        });
}