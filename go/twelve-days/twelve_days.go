// Package twelve offers the lyrics of the song: "The Twelve Days of Christmas."
package twelve

import (
	"fmt"
	"os"
	"strings"
)

const template = "On the %s day of Christmas my true love gave to me: %s."

var data = [][]string{
	{},
	{"first", "and a Partridge in a Pear Tree"},
	{"second", "two Turtle Doves"},
	{"third", "three French Hens"},
	{"fourth", "four Calling Birds"},
	{"fifth", "five Gold Rings"},
	{"sixth", "six Geese-a-Laying"},
	{"seventh", "seven Swans-a-Swimming"},
	{"eighth", "eight Maids-a-Milking"},
	{"ninth", "nine Ladies Dancing"},
	{"tenth", "ten Lords-a-Leaping"},
	{"eleventh", "eleven Pipers Piping"},
	{"twelfth", "twelve Drummers Drumming"},
}

// Verse returns the verse corresponding to given number.
func Verse(i int) string {
	if i < 1 || i > 12 {
		fmt.Printf("Invalid argument: %d", i)
		os.Exit(1)
	}
	return fmt.Sprintf(template, data[i][0], rhyme(i))
}

// Song returns all verses in one string separated by new lines.
func Song() string {
	sb := strings.Builder{}
	sb.Grow(2400)
	for i := 1; i < 12; i++ {
		sb.WriteString(Verse(i))
		sb.WriteRune('\n')
	}
	sb.WriteString(Verse(12))
	return sb.String()
}

func rhyme(n int) string {
	if n == 1 {
		return data[1][1][4:]
	}
	sb := strings.Builder{}
	sb.Grow(262)

	for i := n; i > 1; i-- {
		sb.WriteString(data[i][1])
		sb.WriteString(", ")
	}
	sb.WriteString(data[1][1])
	return sb.String()
}

// 9. Exit
// BenchmarkVerse-4          236526              4999 ns/op            6017 B/op         47 allocs/op
// BenchmarkSong-4           200240              5838 ns/op            8706 B/op         48 allocs/op

// 8. Inline validation
// BenchmarkVerse-4          242506              5051 ns/op            6017 B/op         47 allocs/op
// BenchmarkSong-4           215582              5684 ns/op            8706 B/op         48 allocs/op

// 7. string builder
// BenchmarkVerse-4          247843              4679 ns/op            6017 B/op         47 allocs/op
// BenchmarkSong-4           216784              5272 ns/op            8706 B/op         48 allocs/op

// 6. string builder for Song
// BenchmarkVerse-4          191589              6607 ns/op            5825 B/op         58 allocs/op
// BenchmarkSong-4           168326              7942 ns/op            8514 B/op         59 allocs/op

// 5. empty slice at zeroth index
// BenchmarkVerse-4          194564              6494 ns/op            5825 B/op         58 allocs/op
// BenchmarkSong-4           141574              8143 ns/op            8514 B/op         59 allocs/op

// 4. slice of slices
// BenchmarkVerse-4          190624              6467 ns/op            5825 B/op         58 allocs/op
// BenchmarkSong-4           156322              8169 ns/op            8515 B/op         59 allocs/op

// 3. map
// BenchmarkVerse-4          168164              7398 ns/op            5825 B/op         58 allocs/op
// BenchmarkSong-4           111422              9400 ns/op            8514 B/op         59 allocs/op

// 2. Join
// BenchmarkVerse-4          155566              9003 ns/op            6177 B/op         69 allocs/op
// BenchmarkSong-4           135312             10605 ns/op            9363 B/op         75 allocs/op

// 1. Concatenation
// BenchmarkVerse-4          123079             10788 ns/op           11618 B/op        113 allocs/op
// BenchmarkSong-4            87958             13931 ns/op           14803 B/op        119 allocs/op
