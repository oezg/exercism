// Package resistorcolorduo helps to calculate the resistor value of color bands.
package resistorcolorduo

// Value returns the resistance value of a resistor with a given colors.
func Value(colors []string) int {
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

// 1 SWITCH
// BenchmarkValue-4        19664444                57.06 ns/op            0 B/op          0 allocs/op

// 2 MAP
// BenchmarkValue-4         5602108               221.5 ns/op             0 B/op          0 allocs/op

// 3 SLICE
// BenchmarkValue-4         7205250               160.8 ns/op             0 B/op          0 allocs/op

// 4 ARRAY
// BenchmarkValue-4         3617221               293.7 ns/op             0 B/op          0 allocs/op

// goos: linux
// goarch: amd64
// pkg: resistorcolorduo
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
