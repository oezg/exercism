// Package resistorcolortrio calculates and formats a label for a resistor
// of three color bands.
package resistorcolortrio

import "fmt"

var prefixes = [...]string{"", "kilo", "mega", "giga"}

// Label describes the resistance value given the colors of a resistor.
// The label is a string with a resistance value with an unit appended
// (e.g. "33 ohms", "470 kiloohms").
func Label(colors []string) string {
	if len(colors) < 3 {
		return ""
	}

	value := resistorValue(colors[:2])
	for power := resistorColors[colors[2]]; power > 0; power-- {
		value *= 10
	}

	j := 0
	for ; j < len(prefixes) && value > 1_000; value /= 1_000 {
		j++
	}

	return fmt.Sprintf("%d %sohms", value, prefixes[j])
}

func resistorValue(colors []string) (value int) {
	for i, power := len(colors)-1, 1; i >= 0; i, power = i-1, power*10 {
		value += resistorColors[colors[i]] * power
	}
	return
}

var resistorColors = map[string]int{
	"black":  0,
	"brown":  1,
	"red":    2,
	"orange": 3,
	"yellow": 4,
	"green":  5,
	"blue":   6,
	"violet": 7,
	"grey":   8,
	"white":  9,
}

// BenchmarkLabel-4          507986              2122 ns/op             248 B/op         19 allocs/op
