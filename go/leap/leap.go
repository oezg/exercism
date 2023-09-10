// Package leap provides testing if a year is a leap your or not
package leap

// IsLeapYear reports if a year is a leap year or not
func IsLeapYear(year int) bool {
	if year%400 == 0 {
		return true
	}
	if year%100 == 0 {
		return false
	}
	return year%4 == 0
}
