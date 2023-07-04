using System;
using System.Globalization;
using System.Runtime.InteropServices;


public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late,
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc)
        => TimeZoneInfo.ConvertTimeFromUtc(dtUtc, TimeZoneInfo.Local);

    public static DateTime Schedule(string appointmentDateDescription, Location location) 
        => TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), location.TimeZone());
    
    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel)
        => appointment.Add(alertLevel.Interval());

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        var timeZone = location.TimeZone();
        var weekAgo = dt.AddDays(-7);
        return timeZone.IsDaylightSavingTime(weekAgo) != timeZone.IsDaylightSavingTime(dt);
    }

    public static TimeSpan Interval(this AlertLevel alertLevel)
        => alertLevel switch
        {
            AlertLevel.Early => - TimeSpan.FromDays(1),
            AlertLevel.Standard => - TimeSpan.FromHours(1.75),
            AlertLevel.Late => - TimeSpan.FromMinutes(30),
        };

    public static DateTime NormalizeDateTime(string dtStr, Location location) => 
        DateTime.TryParse(dtStr, location.Culture(), DateTimeStyles.None, out var dateTime) 
            ? dateTime 
            : new DateTime(1,1,1);

    public static CultureInfo Culture(this Location location)
        => location switch
        {
            Location.London => new CultureInfo("en-GB"),
            Location.Paris => new CultureInfo("fr-FR"),
            Location.NewYork => new CultureInfo("en-US"),
        };

    public static TimeZoneInfo TimeZone(this Location location)
        => TimeZoneInfo.FindSystemTimeZoneById(location.TimeZoneId());

    public static string TimeZoneId(this Location location)
        => (RuntimeInformation.IsOSPlatform(OSPlatform.Windows), location) switch
        {
            (true, Location.London) =>  "GMT Standard Time",
            (true, Location.Paris) => "W. Europe Standard Time",
            (true, Location.NewYork) => "Eastern Standard Time",
            (false, Location.London) => "Europe/London",
            (false, Location.Paris) => "Europe/Paris",
            (false, Location.NewYork) => "America/New_York",
        };
    
}
