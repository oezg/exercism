using System;

public static class TwoFer
{
    public static string Speak(string? name = null)
        => $"One for {name ?? "you"}, one for me.";
}