using System;
using System.Linq;

public static class Proverb
{
    public static string[] Recite(string[] subjects) =>
        subjects.Length > 0 ? toProverb(subjects) : Array.Empty<string>();

    static string[] toProverb(string[] subjects) =>
        subjects[1..]
            .Select((subject, index) => $"For want of a {subjects[index]} the {subject} was lost.")
            .Append($"And all for the want of a {subjects.First()}.")
            .ToArray();
}