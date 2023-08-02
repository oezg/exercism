using System;
using System.Text.RegularExpressions;

public static partial class Bob
{
    public static string Response(string statement)
        => statement.IsSilence() ? "Fine. Be that way!"
        : statement.IsQuestion() && statement.IsYell() ? "Calm down, I know what I'm doing!"
        : statement.IsYell() ? "Whoa, chill out!"
        : statement.IsQuestion() ? "Sure."
        : "Whatever.";

    public static bool IsSilence(this string statement) 
        => Silence().IsMatch(statement);

    public static bool IsQuestion(this string statement)
        => Question().IsMatch(statement);

    public static bool IsYell(this string statement)
        => Yell().IsMatch(statement) && !NotYell().IsMatch(statement);
    
    [GeneratedRegex("^\\s*$")]
    private static partial Regex Silence();
    [GeneratedRegex("\\?\\s*$")]
    private static partial Regex Question();
    [GeneratedRegex("[A-Z]")]
    private static partial Regex Yell();
    [GeneratedRegex("[a-z]")]
    private static partial Regex NotYell();
}