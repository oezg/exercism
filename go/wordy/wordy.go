// Package wordy parses and evaluates simple math word problems returning the answer as an integer.
package wordy

import (
	"strconv"
	"strings"
)

// Answer returns the integer result of the operation given in the question.
// Parser rejects unsupported operations and invalid syntax.
func Answer(question string) (int, bool) {
	if !strings.HasPrefix(question, "What is ") || !strings.HasSuffix(question, "?") {
		return 0, false
	}

	question = strings.TrimPrefix(question, "What is ")
	question = strings.TrimSuffix(question, "?")

	unfilteredTokens := strings.Fields(question)
	byFilteredTokens := make([]string, 0, len(unfilteredTokens))
	for _, v := range unfilteredTokens {
		if v == "by" {
			continue
		}
		byFilteredTokens = append(byFilteredTokens, v)
	}

	flag := true
	length := len(byFilteredTokens)
	findNumber := func(numberIdx int) (number int) {
		if numberIdx >= length {
			flag = false
			return
		}
		number, err := strconv.Atoi(byFilteredTokens[numberIdx])
		if err != nil {
			flag = false
			return
		}
		return
	}

	head := findNumber(0)
	for i := 1; flag && i < length; i += 2 {
		number := findNumber(i + 1)
		switch byFilteredTokens[i] {
		case "plus":
			head += number
		case "minus":
			head -= number
		case "multiplied":
			head *= number
		case "divided":
			head /= number
		default:
			flag = false
		}
	}

	return head, flag
}

// 15. `flag` keeps the state
// BenchmarkAnswer-4         287042              4909 ns/op            2780 B/op         48 allocs/op

// 14. Filter "by" words
// BenchmarkAnswer-4         283256              4275 ns/op            2780 B/op         48 allocs/op

// 13. local func `findNumber`
// BenchmarkAnswer-4         418250              2785 ns/op            1416 B/op         25 allocs/op

// 12. naive `split loop and manipulate index` approach, no regex no recursion no types
// BenchmarkAnswer-4         405747              2556 ns/op            1416 B/op         25 allocs/op

// 11. Remove arithmeticOperation and handle Atoi errors
// BenchmarkAnswer-4          52742             22772 ns/op            7821 B/op         86 allocs/op

// 10. For loop instead of recursion
// BenchmarkAnswer-4          53860             23130 ns/op            7823 B/op         86 allocs/op

// 9. FindStringSubmatch instead of MatchString
// BenchmarkAnswer-4          52431             23059 ns/op            7823 B/op         86 allocs/op

// 8. Validate and Iterate
// BenchmarkAnswer-4          38042             30699 ns/op            6569 B/op        110 allocs/op

// 7. Map of operations
// BenchmarkAnswer-4          51970             22325 ns/op            5580 B/op         72 allocs/op

// 6. Constant patterns
// BenchmarkAnswer-4          53384             22476 ns/op            5582 B/op         72 allocs/op

// 5. Reduce one regex
// BenchmarkAnswer-4          63716             18879 ns/op            5603 B/op         72 allocs/op

// 4. Remove MatchString
// BenchmarkAnswer-4          42759             28038 ns/op            6272 B/op         93 allocs/op

// 3. Regexps defined globally
// BenchmarkAnswer-4          29581             40233 ns/op            6273 B/op         93 allocs/op

// 2. FindStringSubmatch
// BenchmarkAnswer-4           1372            916816 ns/op          854768 B/op       8936 allocs/op

// 1. FindAllStringSubmatch
// BenchmarkAnswer-4           1365           1110526 ns/op          862761 B/op       8972 allocs/op
