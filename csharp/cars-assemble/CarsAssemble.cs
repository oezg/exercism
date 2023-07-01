using System;

static class AssemblyLine
{
    const int UNIT_PRODUCTION = 221;

    public static double SuccessRate(int speed)
    {
        if (speed == 0) return 0;
        if (speed >= 1 && speed <= 4) return 1;
        if (speed >= 5 && speed <= 8) return .9;
        if (speed == 9) return .8;
        return .77;
    }
    
    public static double ProductionRatePerHour(int speed)
    {
        return UNIT_PRODUCTION * speed * SuccessRate(speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)Math.Floor(ProductionRatePerHour(speed) / 60);
    }
}
