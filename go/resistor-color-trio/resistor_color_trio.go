// Package resistorcolortrio calculates and formats a label for a resistor
// of three color bands.
package resistorcolortrio

import "fmt"

// Label describes the resistance value given the colors of a resistor.
// The label is a string with a resistance value with an unit appended
// (e.g. "33 ohms", "470 kiloohms").
func Label(colors []string) string {
	value := value(colors[:2])
	for power := resistorValue(colors[2]); power > 0; power-- {
		value *= 10
	}
	j := 0
	for ; value > 1000; value /= 1000 {
		j++
	}
	prefix := [...]string{"", "kilo", "mega", "giga"}[j]

	return fmt.Sprintf("%d %sohms", value, prefix)
}

func value(colors []string) int {
	if len(colors) < 2 {
		return -1
	}
	resistorColor1 := resistorValue(colors[0])
	resistorColor2 := resistorValue(colors[1])
	if resistorColor1 < 0 || resistorColor2 < 0 {
		return -1
	}
	return resistorColor1*10 + resistorColor2
}

func resistorValue(color string) int {
	switch color {
	case "black":
		return 0
	case "brown":
		return 1
	case "red":
		return 2
	case "orange":
		return 3
	case "yellow":
		return 4
	case "green":
		return 5
	case "blue":
		return 6
	case "violet":
		return 7
	case "grey":
		return 8
	case "white":
		return 9
	default:
		return -1
	}
}

// BenchmarkLabel-4          599246              1758 ns/op             248 B/op         19 allocs/op
