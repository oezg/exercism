// Package resistorcolor provides utilities to look up the
// numerical value associated with a particular color band
// and to list the different band colors
package resistorcolor

// Colors returns the list of all colors.
func Colors() []string {
	return []string{
		"black",
		"brown",
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"violet",
		"grey",
		"white",
	}
}

// ColorCode1 returns the resistance value of the given color
// by looking it up inside a map.
func ColorCode1(color string) int {
	colors := map[string]int{
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
	code, ok := colors[color]
	if ok {
		return code
	}
	return -1
}

// ColorCode returns the resistance value of the given color.
func ColorCode(color string) int {
	for i, code := range Colors() {
		if color == code {
			return i
		}
	}
	return -1
}
