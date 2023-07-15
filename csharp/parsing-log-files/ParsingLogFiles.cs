using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class LogParser
{
    public bool IsValidLine(string text)
        => Regex.IsMatch(text, @"\A\[(TRC|DBG|INF|WRN|ERR|FTL)\]");

    public string[] SplitLogLine(string text)
        => Regex.Split(text, @"<[-=^*]*?>");

    public int CountQuotedPasswords(string lines)
        => Regex.Count(lines, "\".*password.*\"", RegexOptions.IgnoreCase);

    public string RemoveEndOfLineText(string line)
        => Regex.Replace(line, @"end-of-line\d*", "");

    public string[] ListLinesWithPasswords(string[] lines)
        => lines.ToList().Select(line =>
        {
            var m = Regex.Match(line, @"password\w+", RegexOptions.IgnoreCase);
            return $"{(m.Success ? m.Groups[0].Value : "--------")}: {line}";
        }).ToArray();
}
