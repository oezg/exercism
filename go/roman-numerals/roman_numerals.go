// Package romannumerals is utility to convert a number from Arabic numerals to Roman numerals.
package romannumerals

import (
	"fmt"
	"strings"
)

var (
	romans = map[int][4]string{
		0: {"", "", "", ""},
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
)

// ToRomanNumeral converts a number from Arabic numerals to Roman numerals.
func ToRomanNumeral(input int) (string, error) {
	if input <= 0 || input >= 4000 {
		return "", fmt.Errorf("%d is out of range", input)
	}
	return toValidRomanNumeral2(input), nil
}

func toValidRomanNumeral2(n int) string {
	return strings.Join(toRomanDigits(digitize(n)), "")
}

func toRomanDigits(digits [4]int) []string {
	out := make([]string, 4)
	for i := 0; i < 4; i++ {
		out[3-i] = romans[digits[i]][i]
	}
	return out
}

func digitize(n int) [4]int {
	out := [4]int{}
	for digit := 0; digit < 4; digit++ {
		exponent := 1
		for j := 0; j < digit; j++ {
			exponent *= 10
		}
		out[digit] = n % (exponent * 10) / exponent
	}
	return out
}
