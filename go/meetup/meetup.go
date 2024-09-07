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
func Day(wSched WeekSchedule, wDay time.Weekday, month time.Month, year int) int {
	meetup := time.Date(year, month, 1, 0, 0, 0, 0, time.UTC)
	for meetup.Weekday() != wDay {
		meetup = meetup.AddDate(0, 0, 1)
	}

	switch wSched {
	case First, Second, Third, Fourth:
		meetup = meetup.AddDate(0, 0, 7*int(wSched))
	case Last:
		meetup = meetup.AddDate(0, 0, 28)
		if meetup.Month() != month {
			meetup = meetup.AddDate(0, 0, -7)
		}
	default:
		for meetup.Day() < 13 {
			meetup = meetup.AddDate(0, 0, 7)
		}
	}
	return meetup.Day()
}
