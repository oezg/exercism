using System;
using System.Text.RegularExpressions;

public class LogParser
{
    public bool IsValidLine(string text)
    {
        string pattern = "^\\[(TRC|DBG|INF|WRN|ERR|FTL)\\]";
        Regex regex = new Regex(pattern);
        return regex.IsMatch(text);
    }

    public string[] SplitLogLine(string text)
    {
        string pattern = "<[-=^*]*>";
        Regex regex = new Regex(pattern);
        return regex.Split(text);
    }

    public int CountQuotedPasswords(string lines)
    {
        string pattern = "\".*password.*\"";
        Regex regex = new Regex(pattern, RegexOptions.IgnoreCase);
        return regex.Count(lines);
    }

    public string RemoveEndOfLineText(string line)
    {
        string pattern = "end-of-line\\d*";
        Regex regex = new Regex(pattern);
        return regex.Replace(line, "");
    }

    public string[] ListLinesWithPasswords(string[] lines)
    {
        string[] result = new string[lines.Length];
        string pattern = "\\S+password|password\\S+";
        Regex regex = new Regex(pattern, RegexOptions.IgnoreCase);
        for (int i = 0; i < lines.Length; i++) 
        {
            var prefix = regex.IsMatch(lines[i])
                ? regex.Match(lines[i]).Groups[0].Value
                : "--------";
            result[i] =  $"{prefix}: {lines[i]}";
        }
        return result;
    }
}
