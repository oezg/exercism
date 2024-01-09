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
    Last,
}

public static class ScheduleExtension
{
    public static Index GetIndex(this Schedule schedule) => schedule switch
    {
        Schedule.Teenth or Schedule.First => 0,
        Schedule.Second => 1,
        Schedule.Third => 2,
        Schedule.Fourth => 3,
        Schedule.Last => ^1,
        _ => throw new ArgumentOutOfRangeException(nameof(schedule)),
    };
} 

public class Meetup
{
    public int Month { get; }

    public int Year { get; }

    public Meetup(int month, int year)
    {
        Month = month;
        Year = year;
    }

    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule) 
        => datesInMonth(dayOfWeek, schedule).ElementAt(schedule.GetIndex());

    private IEnumerable<DateTime> datesInMonth(DayOfWeek dayOfWeek, Schedule schedule)
        => Enumerable.Range(1, DateTime.DaysInMonth(Year, Month))
        .Select(dayNumber => new DateTime(Year, Month, dayNumber))
        .Where(date => date.DayOfWeek == dayOfWeek)
        .SkipWhile(date => schedule == Schedule.Teenth && date.Day < 13);
}