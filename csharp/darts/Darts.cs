using System;

public static class Darts
{
    public static int Score(double x, double y)
    => (Math.Sqrt(Math.Pow(x, 2) + Math.Pow(y, 2))) switch
    {
        <= 1 => 10,
        <= 5 => 5,
        <= 10 => 1,
        _ => 0,
    };
}
