using System;
using System.Collections.Generic;
using System.Linq;

public static class SecretHandshake
{
    static readonly string[] actions = { "wink", "double blink", "close your eyes", "jump", "reverse" };
    public static string[] Commands(int commandValue)
    {
        var commands = actions.Where((v, i) => (commandValue & (1 << i)) == (1 << i));
        return (commands.LastOrDefault("") == "reverse" ? commands.SkipLast(1).Reverse() : commands).ToArray();
    }
}