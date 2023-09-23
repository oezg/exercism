// Package diffsquares provides utilities to find the difference between the
// square of the sum and the sum of the squares of the first N natural numbers.
package diffsquares

// SquareOfSum finds the square of the sum of the first n natural numbers.
func SquareOfSum(n int) int {
	sum := Sum(n)
	return sum * sum
}

// SumOfSquares finds the sum of the squares of the first n natural numbers.
func SumOfSquares(n int) int {
	return Sum(n) * (n*2 + 1) / 3
}

// Sum finds the sum of the first n natural numbers.
func Sum(n int) int {
	return n * (n + 1) / 2
}

// Difference finds the difference between the square of the sum of the first
// n natural numbers and the sum of the squares of the first n natural numbers.
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
