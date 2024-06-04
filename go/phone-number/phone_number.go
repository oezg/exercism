// Package phonenumber cleans up user-entered phone numbers so that they can be sent SMS messages.
// NANP numbers are ten-digit numbers consisting of a three-digit Numbering Plan Area code, commonly
// known as area code, followed by a seven-digit local number. The first three digits of the local number
// represent the exchange code, followed by the unique four-digit number which is the subscriber number.

// The format is usually represented as (NXX)-NXX-XXXX
// where N is any digit from 2 through 9 and X is any digit from 0 through 9.
package phonenumber

import (
	"errors"
	"fmt"
	"regexp"
)

var (
	nonDigit           = regexp.MustCompile(`\D`)
	phoneNumberPattern = regexp.MustCompile(`^1?([2-9]\d{2}[2-9]\d{6})$`)
)

// Number cleans up differently formatted telephone numbers by removing punctuation and the country code (1) if present.
func Number(phoneNumber string) (string, error) {
	stripPunctuation := nonDigit.ReplaceAllString(phoneNumber, "")
	result := phoneNumberPattern.FindStringSubmatch(stripPunctuation)
	if result == nil {
		return "", errors.New("invalid phone number")
	}
	return result[1], nil
}

// AreaCode returns the three-digit Numbering Plan Area code or error if the phone number is invalid.
func AreaCode(phoneNumber string) (string, error) {
	number, err := Number(phoneNumber)
	if err != nil {
		return "", err
	}
	return number[0:3], nil
}

// Format returns the phone number formatted like (613) 995-0253 or error if the phone number is invalid.
func Format(phoneNumber string) (string, error) {
	number, err := Number(phoneNumber)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("(%s) %s-%s", number[0:3], number[3:6], number[6:]), nil
}

// 1 Regular expression
// BenchmarkNumber-4          67506             17242 ns/op            1301 B/op         84 allocs/op
// BenchmarkAreaCode-4        68178             17188 ns/op            1303 B/op         84 allocs/op
// BenchmarkFormat-4          62299             18537 ns/op            1626 B/op        104 allocs/op
