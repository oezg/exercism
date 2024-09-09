// Package meetup is utility to find a suitable date.
package meetup

import (
	"time"
)

// WeekSchedule can be one of five week values: first, second, third, fourth, last, teenth.
type WeekSchedule int

const (
	First WeekSchedule = iota
	Second
	Third
	Fourth
	Last
	Teenth
)

// Day returns the exact date of a meetup, given a month, year, weekday and week.
// If the week schedule argument is not valid it panics.
func Day(wSched WeekSchedule, wDay time.Weekday, month time.Month, year int) int {
	meetup := time.Date(year, month, 1, 0, 0, 0, 0, time.UTC)
	dayslater := func(n int) {
		meetup = meetup.AddDate(0, 0, n)
	}
	for ; meetup.Weekday() != wDay; dayslater(1) {
	}

	switch wSched {
	case First, Second, Third, Fourth:
		dayslater(int(wSched) * 7)
	case Last:
		dayslater(28)
		if meetup.Month() != month {
			dayslater(-7)
		}
	case Teenth:
		for ; meetup.Day() < 13; dayslater(7) {
		}
	default:
		panic("invalid week schedule")
	}
	return meetup.Day()
}
