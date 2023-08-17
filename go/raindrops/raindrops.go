package raindrops

import (
	"strconv"
	"strings"
)

func Convert(number int) string {
	var result strings.Builder
	if number%3 == 0 || number%5 == 0 || number%7 == 0 {
		if number%3 == 0 {
			result.WriteString("Pling")
		}
		if number%5 == 0 {
			result.WriteString("Plang")
		}
		if number%7 == 0 {
			result.WriteString("Plong")
		}
	} else {
		result.WriteString(strconv.Itoa(number))
	}
	return result.String()
}
