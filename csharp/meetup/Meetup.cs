using System;
using System.Collections.Generic;

public enum Schedule
{
    Teenth,
    First,
    Second,
    Third,
    Fourth,
    Last
}

public class Meetup
{
    public int Month { get; set; }

    public int Year { get; set; }

    public Meetup(int month, int year)
    {
        Month = month;
        Year = year;
    }

    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule) => schedule switch
    {
        Schedule.Teenth => teenthOccurrence(dayOfWeek),
        Schedule.First => firstOccurrence(dayOfWeek),
        Schedule.Second => firstOccurrence(dayOfWeek).AddDays(7),
        Schedule.Third => firstOccurrence(dayOfWeek).AddDays(14),
        Schedule.Fourth => firstOccurrence(dayOfWeek).AddDays(21),
        Schedule.Last => lastOccurrence(dayOfWeek),
        _ => throw new ArgumentException(),
    };

    private DateTime firstOccurrence(DayOfWeek dayOfWeek)
    {
        DateTime dt = new DateTime(Year, Month, 1);
        while (dt.DayOfWeek != dayOfWeek) 
        {
            dt = dt.AddDays(1);
        }
        return dt;
    }

    private DateTime lastOccurrence(DayOfWeek dayOfWeek)
    {
        DateTime dt = new DateTime(Year, Month, DateTime.DaysInMonth(Year, Month));
        while (dt.DayOfWeek != dayOfWeek)
        {
            dt = dt.AddDays(-1);
        }
        return dt;
    }

    private DateTime teenthOccurrence(DayOfWeek dayOfWeek)
    {
        DateTime dt = new DateTime(Year, Month, 13);
        while (dt.DayOfWeek != dayOfWeek)
        {
            dt = dt.AddDays(1);
        }
        return dt;
    }
}