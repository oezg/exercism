using System;

public static class LogAnalysis
{
    public static string SubstringAfter(this string logLine, string start)
        => logLine[(logLine.IndexOf(start) + start.Length)..];

    public static string SubstringBetween(this string logLine, string start, string end)
        => logLine.SubstringAfter(start).SubstringBefore(end);

    public static string SubstringBefore(this string logLine, string end)
        => logLine[..logLine.IndexOf(end)];

    public static string Message(this string logLine) => logLine.SubstringAfter("]: ");

    public static string LogLevel(this string logLine) => logLine.SubstringBetween("[", "]: ");
}