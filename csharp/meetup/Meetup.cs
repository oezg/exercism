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
        Schedule.Teenth => Dates.Where(date => date.DayOfWeek == dayOfWeek).First(date => date.Day > 12), 
        Schedule.First => Dates.First(date => date.DayOfWeek == dayOfWeek), 
        Schedule.Second => Dates.Where(date => date.DayOfWeek == dayOfWeek).ElementAt(1), 
        Schedule.Third => Dates.Where(date => date.DayOfWeek == dayOfWeek).ElementAt(2),
        Schedule.Fourth => Dates.Where(date => date.DayOfWeek == dayOfWeek).ElementAt(3),
        Schedule.Last => Dates.Last(date => date.DayOfWeek == dayOfWeek), 
        _ => throw new ArgumentException(),
    };

    private DateTime firstOccurrenceAfterOffset(DayOfWeek dayOfWeek, int offset = 0)
    {
        DateTime dt = new DateTime(Year, Month, offset + 1);
        return dt.AddDays(((dayOfWeek - dt.DayOfWeek) % WeekLength + WeekLength) % WeekLength);
    }
}