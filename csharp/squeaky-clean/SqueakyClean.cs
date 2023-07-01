using System;
using System.Text;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        StringBuilder sb = new StringBuilder();
        bool prevDash = false;

        foreach (char c in identifier)
        {
            if (c == ' ')
            {
                sb.Append('_');
            }
            else if (Char.IsControl(c))
            {
                sb.Append("CTRL");
            }
            else if (c == '-')
            {
                prevDash = true;
            }
            else if (Char.IsLetter(c) && !(c >= 'α' && c <= 'ω'))
            {
                sb.Append(prevDash ? Char.ToUpper(c) : c);
                prevDash = false;
            }
        }
        return sb.ToString();
    }
}
