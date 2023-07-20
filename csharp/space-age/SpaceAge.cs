using System;

public class SpaceAge
{
    private readonly int _seconds;

    private const int _earthYearInSeconds = 31_557_600;

    public SpaceAge(int seconds) => _seconds = seconds;

    public double OnEarth() => (double)_seconds / _earthYearInSeconds;

    public double OrbitalPeriod(double ratio) => OnEarth() / ratio;

    public double OnMercury() => OrbitalPeriod(0.2408467);

    public double OnVenus() => OrbitalPeriod(0.61519726);
    
    public double OnMars() => OrbitalPeriod(1.8808158);

    public double OnJupiter() => OrbitalPeriod(11.862615);

    public double OnSaturn() => OrbitalPeriod(29.447498);

    public double OnUranus() => OrbitalPeriod(84.016846);

    public double OnNeptune() => OrbitalPeriod(164.79132);
}