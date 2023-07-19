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
        Schedule.Teenth => firstOccurrenceAfterOffset(dayOfWeek, 13),
        Schedule.First => firstOccurrenceAfterOffset(dayOfWeek),
        Schedule.Second => firstOccurrenceAfterOffset(dayOfWeek, 8),
        Schedule.Third => firstOccurrenceAfterOffset(dayOfWeek, 15),
        Schedule.Fourth => firstOccurrenceAfterOffset(dayOfWeek, 22),
        Schedule.Last => firstOccurrenceAfterOffset(dayOfWeek, DateTime.DaysInMonth(Year, Month) - 6),
        _ => throw new ArgumentException(),
    };

    private DateTime firstOccurrenceAfterOffset(DayOfWeek dayOfWeek, int offset = 1)
    {
        DateTime dt = new DateTime(Year, Month, offset);
        dt = dt.AddDays(((dayOfWeek - dt.DayOfWeek) % 7 + 7) % 7);
        return dt;
    }
}