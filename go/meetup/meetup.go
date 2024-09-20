// Package meetup is utility to find a suitable date.
package meetup

import (
	"time"
)

// WeekSchedule can be one of five week values: first, second, third, fourth, last, teenth.
type WeekSchedule int

const (
	Teenth WeekSchedule = iota - 2
	Last
	First
	Second
	Third
	Fourth
)

// Day returns the exact date of a meetup, given a month, year, weekday and week.
func Day(wSched WeekSchedule, wDay time.Weekday, month time.Month, year int) int {
	meetup := time.Date(year, month, 1, 0, 0, 0, 0, time.UTC)
	dayslater := func(n int) {
		meetup = meetup.AddDate(0, 0, n)
	}
	for meetup.Weekday() != wDay {
		dayslater(1)
	}

	switch wSched {
	case Teenth:
		for meetup.Day() < 13 {
			dayslater(7)
		}
	case Last:
		dayslater(28)
		if meetup.Month() != month {
			dayslater(-7)
		}
	default:
		dayslater(int(wSched) * 7)
	}
	return meetup.Day()
}
