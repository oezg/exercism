using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;

public static class SecretHandshake
{
    static readonly ImmutableSortedDictionary<int, Func<IEnumerable<string>, IEnumerable<string>>> s_actions =
        ImmutableSortedDictionary<int, Func<IEnumerable<string>, IEnumerable<string>>>.Empty
            .Add(0b00001, actions => actions.Append("wink"))
            .Add(0b00010, actions => actions.Append("double blink"))
            .Add(0b00100, actions => actions.Append("close your eyes"))
            .Add(0b01000, actions => actions.Append("jump"))
            .Add(0b10000, actions => actions.Reverse());

    public static string[] Commands(int commandValue)
    {
        if (commandValue < 0 || commandValue > 0b11111)
            throw new ArgumentOutOfRangeException(nameof(commandValue), commandValue, "must be between 0 and 31");

        return s_actions
            .Aggregate(
                Enumerable.Empty<string>(),
                (actions, action) => (commandValue & action.Key) > 0 ? action.Value.Invoke(actions) : actions
            )
            .ToArray();
    }
}