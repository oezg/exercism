using System;
using System.Linq;
using System.Text;

public static class RotationalCipher
{
    public static string Rotate(string text, int shiftKey)
    {
        StringBuilder stringBuilder = new StringBuilder();
        text.ToList().ForEach(chr => stringBuilder.Append(
            chr switch {
                <= 'z' and >= 'a' => (char)('a' + ((chr - 'a' + shiftKey) % 26)),
                <= 'Z' and >= 'A' => (char)('A' + ((chr - 'A' + shiftKey) % 26)),
                _ => chr}
            ));
        return stringBuilder.ToString();
    }
}