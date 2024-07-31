// Package bottlesong recites the lyrics to that popular children's repetitive song: Ten Green Bottles.
package bottlesong

import (
	"fmt"
	"strings"
)

const (
	prefix     = "%s green bottle%s hanging on the wall,"
	midline    = "And if one green bottle should accidentally fall,"
	suffix     = "There'll be %s green bottle%s hanging on the wall."
	maxBottles = 10
	minBottles = 1
)

var numbers = map[int]string{
	10: "Ten",
	9:  "Nine",
	8:  "Eight",
	7:  "Seven",
	6:  "Six",
	5:  "Five",
	4:  "Four",
	3:  "Three",
	2:  "Two",
	1:  "One",
	0:  "No",
}

// Recite takes a start number and a number of bottles and returns a slice of strings filled with the
// verses indicated by those numbers. It returns nil if the given numbers are out of range.
func Recite(startBottles, takeDown int) []string {
	if startBottles < minBottles || startBottles > maxBottles {
		return nil
	}

	if takeDown < minBottles || takeDown > startBottles {
		return nil
	}

	out := make([]string, 0, takeDown*5)

	for i := startBottles; i > startBottles-takeDown; i-- {
		out = append(out, verse(i)...)
	}

	return out[1:]
}

func verse(n int) []string {
	endingPrefix, endingSuffix := pluralEndings(n)
	firstLine := fmt.Sprintf(prefix, numbers[n], endingPrefix)
	lastLine := fmt.Sprintf(suffix, strings.ToLower(numbers[n-1]), endingSuffix)
	return []string{"", firstLine, firstLine, midline, lastLine}
}

func pluralEndings(n int) (prefix, suffix string) {
	switch n {
	case 1:
		return "", "s"
	case 2:
		return "s", ""
	default:
		return "s", "s"
	}
}
