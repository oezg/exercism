package raindrops

import "fmt"

func Convert(number int) string {
	var result string
	if number%3*number%5*number%7 == 0 {
		if number%3 == 0 {
			result += "Pling"
		}
		if number%5 == 0 {
			result += "Plang"
		}
		if number%7 == 0 {
			result += "Plong"
		}
	} else {
		result = fmt.Sprintf("%d", number)
	}
	return result
}
