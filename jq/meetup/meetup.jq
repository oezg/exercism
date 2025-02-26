def begin:
    {first: 1, second: 8, third: 15, fourth: 22, teenth: 13, last: -6}[.week];

.dayofweek as $day_of_week
| [.year, .month - if .week == "last" then 0 else 1 end, begin, 0, 0, 0, 0, 0]
| until((mktime | strftime("%A")) == $day_of_week; .[2] += 1)
| mktime
| strftime("%Y-%m-%d")