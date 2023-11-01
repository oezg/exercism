// Package bob determines what Bob will reply to someone when they say
// something to him or ask him a question.
//
// Bob is a lackadaisical teenager. He likes to think that he's very cool.
// And he definitely doesn't get excited about things. That wouldn't be cool.
package bob

import (
	"strings"
	"unicode"
)

// Hey returns
// "Sure." if the remark ends with a question mark - question.
// "Whoa, chill out!" if the remark is ALL CAPITAL LETTERS - yell.
// "Calm down, I know what I'm doing!" if the remark is a yell and a question.
// "Fine. Be that way!" if the remark is empty, or whitespace characters - silence.
// "Whatever." for anything else.
func Hey(remark string) string {
	switch score(strings.TrimSpace(remark)) {
	case 1:
		return "Sure."
	case 2:
		return "Whoa, chill out!"
	case 3:
		return "Calm down, I know what I'm doing!"
	case 4:
		return "Fine. Be that way!"
	default:
		return "Whatever."
	}
}

// score returns the sum of points for each condition the remark string satisfies.
//
// Depending on whether it is a question, a yell or both or silence, the possible
// return values are 0, 1, 2, 3, and 4.
func score(remark string) int {

	// Map of int to func because func cannot be key in a map!
	// Values represent conditions, keys are respective points.
	scorings := map[int]func(string) bool{
		1: func(s string) bool {
			return strings.HasSuffix(s, "?")
		},
		2: func(s string) bool {
			for _, letter := range s {
				if unicode.IsLower(letter) {
					return false
				}
			}
			return strings.ContainsFunc(s, func(c rune) bool {
				return unicode.IsUpper(c)
			})
		},
		4: func(s string) bool {
			return len(s) == 0
		},
	}

	scoring := 0

	// Summing works because silence is mutually exclusive with
	// the other two conditions, question and yell.
	for point, condition := range scorings {
		if condition(remark) {
			scoring += point
		}
	}

	return scoring
}
