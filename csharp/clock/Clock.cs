using System;

public class Clock : IEquatable<Clock>
{
    public const int MaxStamp = 60 * 24;
    public int Stamp { get; set; }

    public Clock(int hours, int minutes) : this(hours * 60 + minutes)
    { }

    public Clock(int minutes)
    {
        Stamp = minutes % MaxStamp;
        if (Stamp < 0)
            Stamp += MaxStamp;
    }

    public Clock Add(int minutesToAdd) 
        => new(Stamp + minutesToAdd);

    public Clock Subtract(int minutesToSubtract) 
        => Add(-minutesToSubtract);

    public override string ToString()
        => $"{Stamp / 60:D2}:{Stamp % 60:D2}";

    public override bool Equals(object obj) 
        => Equals(obj as Clock);

    public bool Equals(Clock other) 
        => ReferenceEquals(this, other) || other is not null && Stamp == other.Stamp;

    public override int GetHashCode() 
        => Stamp;
}
