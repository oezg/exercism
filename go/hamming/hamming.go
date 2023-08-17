package hamming

import (
	"fmt"
)

func Distance(a, b string) (hamming int, err error) {
	if len(a) != len(b) {
		err = fmt.Errorf("strings must have equal length")
		return
	}
	aRunes, bRunes := []rune(a), []rune(b)
	for i, aRune := range aRunes {
		if aRune != bRunes[i] {
			hamming++
		}
	}
	return
}
