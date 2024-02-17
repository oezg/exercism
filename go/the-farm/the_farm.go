// Package thefarm is a learning exercise for error handling.
package thefarm

import (
	"errors"
	"fmt"
)

// InvalidCowsError provides specific error messages for the number of cows.
type InvalidCowsError struct {
	numCows int
	message string
}

func (e *InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.numCows, e.message)
}

// DivideFood returns the amount of food per cow or an error if one occurred.
func DivideFood(fc FodderCalculator, numCows int) (float64, error) {
	totalAmount, err := fc.FodderAmount(numCows)
	if err != nil {
		return 0, err
	}
	fatteningFactor, err := fc.FatteningFactor()
	if err != nil {
		return 0, err
	}
	return totalAmount / float64(numCows) * fatteningFactor, nil
}

// ValidateInputAndDivideFood returns the results of DivideFood
// or an error if the number of cows is not greater than 0.
func ValidateInputAndDivideFood(fc FodderCalculator, numCows int) (float64, error) {
	if numCows <= 0 {
		return 0, errors.New("invalid number of cows")
	}
	return DivideFood(fc, numCows)
}

// ValidateNumberOfCows returns error with a custom message
// when the number of coses is not greater than 0.
func ValidateNumberOfCows(numCows int) error {
	if numCows < 0 {
		return &InvalidCowsError{
			numCows: numCows,
			message: "there are no negative cows",
		}
	}
	if numCows == 0 {
		return &InvalidCowsError{
			numCows: numCows,
			message: "no cows don't need food",
		}
	}
	return nil
}
