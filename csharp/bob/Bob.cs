using System;
using System.Text.RegularExpressions;

public static class Bob
{
    public static string Response(string statement)
        => statement.IsSilence() ? "Fine. Be that way!" 
        : statement.IsQuestion() && statement.IsYell() ? "Calm down, I know what I'm doing!" 
        : statement.IsYell() ? "Whoa, chill out!"
        : statement.IsQuestion() ? "Sure."
        : "Whatever.";

    public static bool IsSilence(this string statement) 
        => Regex.IsMatch(statement, "^\\s*$");

    public static bool IsQuestion(this string statement)
        => Regex.IsMatch(statement, "\\?\\s*$");

    public static bool IsYell(this string statement)
        => Regex.IsMatch(statement, "[A-Z]") && !Regex.IsMatch(statement, "[a-z]");
}