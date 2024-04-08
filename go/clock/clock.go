// Package clock is a clock implementation.
package clock

import "fmt"

// Minute represents a minute in clock.
type Minute uint16

// toMinute returns the given number in minutes.
func toMinute(minutes int) Minute {
	const minutesInDay = 24 * 60
	modulo := func(num, mod int) int {
		return ((num % mod) + mod) % mod
	}
	return Minute(modulo(minutes, minutesInDay))
}

// Clock implements the clock with one field.
type Clock struct {
	Minutes Minute
}

// New returns a new clock from given hours and minutes.
func New(h, m int) Clock {
	return Clock{Minutes: toMinute(h*60 + m)}
}

// Add returns a new clock with the given number of minutes added to the receiver clock.
func (c Clock) Add(m int) Clock {
	return New(0, int(c.Minutes)+m)
}

// Subtract returns a new clock with the given number of minutes subtracted from the receiver clock.
func (c Clock) Subtract(m int) Clock {
	return c.Add(-m)
}

// String returns a string representation of the clock.
func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.Minutes/60, c.Minutes%60)
}

// goos: linux
// goarch: amd64
// pkg: clock
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz

// INT
// BenchmarkAddMinutes-4           335680532                3.499 ns/op           0 B/op          0 allocs/op
// BenchmarkSubtractMinutes-4      335853228                3.480 ns/op           0 B/op          0 allocs/op
// BenchmarkCreateClocks-4          81661189               13.49 ns/op            0 B/op          0 allocs/op

// UINT16
// BenchmarkAddMinutes-4           253546959                4.647 ns/op           0 B/op          0 allocs/op
// BenchmarkSubtractMinutes-4      252239953                4.630 ns/op           0 B/op          0 allocs/op
// BenchmarkCreateClocks-4         157343528                7.564 ns/op           0 B/op          0 allocs/op
