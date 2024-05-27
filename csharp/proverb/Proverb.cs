using System;
using System.Collections.Generic;
using System.Linq;

public static class Proverb
{
    public static string[] Recite(string[] subjects) => subjects.Length > 0 ? subjects.ToProverb().ToArray() : Array.Empty<string>();

    public static IEnumerable<string> ToProverb(this IEnumerable<string> subjects) => subjects
                    .Zip(subjects.Skip(1))
                    .Select(subjectPair => $"For want of a {subjectPair.First} the {subjectPair.Second} was lost.")
                    .Append($"And all for the want of a {subjects.First()}.");
}