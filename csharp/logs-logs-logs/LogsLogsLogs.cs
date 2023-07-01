using System;

enum LogLevel
{
    Unknown,
    Trace,
    Debug,
    Info = 4,
    Warning,
    Error,
    Fatal = 42
}

static class LogLine
{
    public static LogLevel ParseLogLevel(string logLine)
        => logLine.SubstringBetween("[", "]: ") switch
        {
            "TRC" => LogLevel.Trace,
            "DBG" => LogLevel.Debug,
            "INF" => LogLevel.Info,
            "WRN" => LogLevel.Warning,
            "ERR" => LogLevel.Error,
            "FTL" => LogLevel.Fatal,
            _ => LogLevel.Unknown
        };

    public static string OutputForShortLog(LogLevel logLevel, string message) 
        => $"{Convert.ChangeType(logLevel, logLevel.GetTypeCode())}:{message}";

    public static string SubstringBetween(this string logLine, string start, string end) 
        => logLine[(logLine.IndexOf(start) + start.Length)..logLine.IndexOf(end)];
}
