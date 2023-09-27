// Package luhn provides utilities to determine whether or not
// given number is valid per the Luhn formula.
package luhn

import (
	"errors"
	"unicode"
)

// Valid returns true if the number is valid per Luhn formula.
func Valid(id string) bool {
	digits, err := ExtractDigits(id)
	if err != nil {
		return false
	}
	DoubleEverySecondDigitFromRight(digits)
	return SumDigits(digits)%10 == 0
}

// ExtractDigits accepts a string and returns a slice of integers
// that contains the decimal digits in the string.
// If the string contains non digit characters or it is too short
// or contains only digit zero then an error is raised.
func ExtractDigits(id string) ([]int, error) {
	if len(id) < 2 {
		return nil, errors.New("id shorter than 2")
	}

	digits := []int{}
	for _, chr := range id {
		if unicode.IsSpace(chr) {
			continue
		}
		if !unicode.IsDigit(chr) {
			return nil, errors.New("non digit character")
		}
		digit := int(chr - '0')
		digits = append(digits, digit)
	}

	if len(digits) == 1 && digits[0] == 0 {
		return nil, errors.New("single zero with space")
	}
	return digits, nil
}

// DoubleEverySecondDigitFromRight accepts a slice of integers
// and multiplies every second element from the end with two
// and subtracts 9 if the result of the multiplication is greater
// than 9. Does not return anythink, modifies the slice elements.
func DoubleEverySecondDigitFromRight(digits []int) {
	for i := len(digits) - 2; i >= 0; i -= 2 {
		digits[i] *= 2
		if digits[i] > 9 {
			digits[i] -= 9
		}
	}
}

// SumDigits accepts a slice of integers and returns their sum.
func SumDigits(digits []int) int {
	sum := 0
	for _, digit := range digits {
		sum += digit
	}
	return sum
}
