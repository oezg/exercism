// Package gigasecond determines the date and time one gigasecond after a date.
package gigasecond

// import path for the time package from the standard library
import "time"

// AddGigasecond returns the time one thousand million seconds after given time.
func AddGigasecond(t time.Time) time.Time {
	const gigasecond time.Duration = 1_000_000_000 * time.Second
	return t.Add(gigasecond)
}
