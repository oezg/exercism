// Package grains provides utilities to calculate the number of grains of wheat
// on a chessboard given that the number on each square doubles.
package grains

import (
	"errors"
)

// Square calculates how many grains were on a given square.
func Square(number int) (uint64, error) {
	if number < 1 || number > 64 {
		return 0, errors.New("invalid argument: number must be betweeen 1 and 64")
	}
	return 1 << (number - 1), nil
}

// Total calculates the total number of grains on the chessboard.
func Total() uint64 {
	return ^uint64(0)
}
