using System;

public class Clock : IEquatable<Clock>
{
    #region fields
    private const int _maxStamp = 60 * 24;
    private readonly int _stamp;
    #endregion

    #region constructors
    public Clock(int hours, int minutes) : this(hours * 60 + minutes) { }

    public Clock(int minutes)
        => _stamp = s_modulusMinutes(minutes);
    #endregion

    #region methods
    private static int s_modulusMinutes(int minutes)
        => s_modulus(minutes, _maxStamp);

    private static int s_modulus(int a, int b)
    {
        int c = a % b;
        if (c < 0 && b > 0 || c > 0 && b < 0)
        {
            c += b;
        }
        return c;
    }

    public Clock Add(int minutesToAdd) 
        => new(_stamp + minutesToAdd);

    public Clock Subtract(int minutesToSubtract) 
        => Add(-minutesToSubtract);

    public override string ToString()
        => $"{_stamp / 60:D2}:{_stamp % 60:D2}";

    public override bool Equals(object obj) 
        => Equals(obj as Clock);

    public bool Equals(Clock other) 
        => ReferenceEquals(this, other) || other is not null && _stamp == other._stamp;

    public override int GetHashCode() 
        => _stamp;
    #endregion
}
