package meetup

import "time"

// Define the WeekSchedule type here.
type WeekSchedule int

const (
	Teenth WeekSchedule = iota
	First
	Second
	Third
	Fourth
	Last
)

func Day(wSched WeekSchedule, wDay time.Weekday, month time.Month, year int) int {
	t := time.Date(year, month)
}
