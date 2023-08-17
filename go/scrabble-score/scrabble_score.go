package scrabble

import "strings"

func Score(word string) (totalScore int) {
	for _, letter := range strings.ToUpper(word) {
		totalScore += score(letter)
	}
	return
}

func score(letter rune) (value int) {
	switch letter {
	case 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T':
		value = 1
	case 'D', 'G':
		value = 2
	case 'B', 'C', 'M', 'P':
		value = 3
	case 'F', 'H', 'V', 'W', 'Y':
		value = 4
	case 'K':
		value = 5
	case 'J', 'X':
		value = 8
	case 'Q', 'Z':
		value = 10
	default:
		value = 0
	}
	return
}
