using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

public static class SecretHandshake
{
    [Flags]
    public enum Action
    {
        wink = 1,
        double_blink = wink << 1,
        close_your_eyes = wink << 2,
        jump = wink << 3,
        reverse = wink << 4,
    }

    public static IEnumerable<string> Actions (this Action action)
        => Enum.GetValues<Action>()
            .Where(item => action.HasFlag(item))
            .Select(item => item.ToString().Replace("_", " "));

    public static string[] Commands(int commandValue)
    {
        var commands = ((Action)(commandValue % 32)).Actions();
        return commands.LastOrDefault() != "reverse" 
            ? commands.ToArray()
            : commands.Take(commands.Count() - 1).Reverse().ToArray();
    }
}
