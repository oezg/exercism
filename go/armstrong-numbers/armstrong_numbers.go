// Package armstrong is helper for working with Armstrong numbers.
// An Armstrong number is a number that is the sum of its own digits
// each raised to the power of the number of digits.
package armstrong

import "math"

// IsNumber determines whether a number is an Armstrong number but panics when the given number is negative.
func IsNumber(n int) bool {
	if n < 0 {
		panic("Armstrong number is not defined for negative numbers")
	}

	exp := math.Ceil(math.Log10(float64(n)))
	for tmp := n; tmp > 0; tmp /= 10 {
		n -= int(math.Pow(float64(tmp%10), exp))
	}

	return n == 0
}
