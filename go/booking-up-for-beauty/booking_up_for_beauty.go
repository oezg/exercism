package booking

import (
	"fmt"
	"log"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	t, err := time.Parse("1/2/2006 15:4:5", date)
	if err != nil {
		log.Fatal(err)
	}
	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	t, err := time.Parse("January 2, 2006 15:4:5", date)
	if err != nil {
		log.Fatal(err)
	}
	return t.Before(time.Now())
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	t, err := time.Parse("Monday, January 2, 2006 15:4:5", date)
	if err != nil {
		log.Fatal(err)
	}
	return t.Hour() >= 12 && t.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	t, err := time.Parse("1/2/2006 15:4:5", date)
	if err != nil {
		log.Fatal(err)
	}
	return fmt.Sprintf("You have an appointment on %s.", t.Format("Monday, January 2, 2006, at 15:4"))
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
