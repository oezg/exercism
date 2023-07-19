using System;
using System.Collections.Generic;
using System.Linq;

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
    private const int WeekLength = 7;

    public int Month { get; set; }

    public int Year { get; set; }

    public IEnumerable<DateTime> Dates { get; }

    public Meetup(int month, int year)
    {
        Month = month;
        Year = year;
        Dates = Enumerable.Range(1, DateTime.DaysInMonth(Year, Month)).Select(dayNumber => new DateTime(Year, Month, dayNumber));
    }

    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule) => schedule switch
    {
        Schedule.Teenth => firstOccurrenceAfterOffset(dayOfWeek, 12),
        Schedule.First => firstOccurrenceAfterOffset(dayOfWeek, 0 * WeekLength),
        Schedule.Second => firstOccurrenceAfterOffset(dayOfWeek, 1 * WeekLength),
        Schedule.Third => firstOccurrenceAfterOffset(dayOfWeek, 2 * WeekLength),
        Schedule.Fourth => firstOccurrenceAfterOffset(dayOfWeek, 3 * WeekLength),
        Schedule.Last => firstOccurrenceAfterOffset(dayOfWeek, DateTime.DaysInMonth(Year, Month) - WeekLength),
        _ => throw new ArgumentException(),
    };

    private DateTime firstOccurrenceAfterOffset(DayOfWeek dayOfWeek, int offset = 0)
    {
        DateTime dt = new DateTime(Year, Month, offset + 1);
        return dt.AddDays(((dayOfWeek - dt.DayOfWeek) % WeekLength + WeekLength) % WeekLength);
    }
}