using System;

public class Clock : IEquatable<Clock>
{
    public const int MaxStamp = 60 * 24;
    public int Stamp { get; set; }

    //public Tuple<int, int> HoursMinutes 
    //    => 

    public Clock(int hours, int minutes) : this(hours * 60 + minutes)
    {
        
        //Stamp = (hours * 60 + minutes) % MaxStamp;
        //if (Stamp < 0)
        //{
        //    Stamp += MaxStamp;
        //}
    }

    public Clock(int minutes)
    {
        Stamp = minutes % MaxStamp;
        if (Stamp < 0) { Stamp += MaxStamp; }
    }
    
    public Clock Add(int minutesToAdd)
    {
        return new Clock(Stamp + minutesToAdd);
    }
    public Clock Subtract(int minutesToSubtract)
    {
        return Add(-minutesToSubtract);
    }

    public override string ToString()
        => $"{Stamp / 60:D2}:{Stamp % 60:D2}";
        //=> String.Format("{0:D2}:{1:D2}", HoursMinutes;

    public override bool Equals(object obj) 
        => Equals(obj as Clock);

    public bool Equals(Clock other) 
        => ReferenceEquals(this, other) || other is Clock && Stamp == other.Stamp;

    public override int GetHashCode() 
        => Stamp;

}
