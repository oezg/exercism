// Package romannumerals is utility to convert a number from Arabic numerals to Roman numerals.
package romannumerals

import (
	"fmt"
	"math"
	"strings"
)

// ToRomanNumeral converts a number from Arabic numerals to Roman numerals.
func ToRomanNumeral(input int) (string, error) {
	if input <= 0 || input >= 4000 {
		return "", fmt.Errorf("%d is out of range", input)
	}
	return validRomanNumeral(input), nil
}

func validRomanNumeral(n int) string {
	return strings.Join(roman(digits(n)), "")
}

func roman(digits [4]int) []string {
	romans := map[int][4]string{
		0: {},
		1: {"I", "X", "C", "M"},
		2: {"II", "XX", "CC", "MM"},
		3: {"III", "XXX", "CCC", "MMM"},
		4: {"IV", "XL", "CD"},
		5: {"V", "L", "D"},
		6: {"VI", "LX", "DC"},
		7: {"VII", "LXX", "DCC"},
		8: {"VIII", "LXXX", "DCCC"},
		9: {"IX", "XC", "CM"},
	}
	out := make([]string, 4)
	for i := 0; i < 4; i++ {
		out[3-i] = romans[digits[i]][i]
	}
	return out
}

func digits(n int) [4]int {
	out := [4]int{}
	for digit := 0; digit < 4; digit++ {
		exponent := int(math.Pow10(digit))
		out[digit] = n % (exponent * 10) / exponent
	}
	return out
}
