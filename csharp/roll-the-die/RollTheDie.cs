using System;

public class Player
{
    private static readonly Random _random = new Random();
    private const int _dieSize = 18;
    private const int _maxSpellStrength = 100;

    public int RollDie() => _random.Next(1, _dieSize + 1);

    public double GenerateSpellStrength() => _random.NextDouble() * _maxSpellStrength;
}
