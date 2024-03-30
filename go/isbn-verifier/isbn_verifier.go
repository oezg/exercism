// Package isbn is utility to verify ISBN-10 both with and without separating dashes.
package isbn

// IsValidISBN checks if the provided string is a valid ISBN-10.
func IsValidISBN(isbn string) bool {
	total, value, multiplier := 0, 0, 10
	for _, digit := range isbn {
		switch {
		case digit == 'X' && multiplier == 1:
			value = 10
		case digit >= '0' && digit <= '9':
			value = int(digit) - '0'
		case digit == '-':
			continue
		default:
			return false
		}
		total += value * multiplier
		multiplier--
	}
	return total%11 == 0 && multiplier == 0
}

// 1. Iteration
// BenchmarkIsValidISBN-4            344204              3148 ns/op            2360 B/op         59 allocs/op
// BenchmarkIsValidISBN-4            353296              3131 ns/op            2360 B/op         59 allocs/op
// PASS
// ok      isbn    1.145s

// 2. Iteration
// BenchmarkIsValidISBN-4           4336866               278.1 ns/op             0 B/op          0 allocs/op
// BenchmarkIsValidISBN-4           4473267               261.2 ns/op             0 B/op          0 allocs/op
// PASS
// ok      isbn    1.444s
