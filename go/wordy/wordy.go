// Package wordy parses and evaluates simple math word problems returning the answer as an integer.
package wordy

import (
	"regexp"
	"strconv"
)

type biFunc func(int, int) int

type arithmeticOperation = string

const (
	plus              arithmeticOperation = "plus"
	minus             arithmeticOperation = "minus"
	multiply          arithmeticOperation = "multiplied by"
	divide            arithmeticOperation = "divided by"
	patternValidation                     = `^What is (-?\d+)(` + patternIteration + `)*\?$`
	patternIteration                      = ` (` + plus + `|` + minus + `|` + multiply + `|` + divide + `) (-?\d+)`
)

var (
	rexpValidate = regexp.MustCompile(patternValidation)
	rexpIterate  = regexp.MustCompile(patternIteration)
	operations   = map[arithmeticOperation]biFunc{
		plus:     func(i1, i2 int) int { return i1 + i2 },
		minus:    func(i1, i2 int) int { return i1 - i2 },
		multiply: func(i1, i2 int) int { return i1 * i2 },
		divide:   func(i1, i2 int) int { return i1 / i2 },
	}
)

// Answer returns the integer result of the operation given in the question.
// Parser rejects unsupported operations and invalid syntax.
func Answer(question string) (int, bool) {
	validQuestion := rexpValidate.FindStringSubmatch(question)
	if validQuestion == nil {
		return 0, false
	}

	head, _ := strconv.Atoi(validQuestion[1])

	rest := rexpIterate.FindAllStringSubmatch(question, -1)

	return foldOperations(head, rest), true
}

func foldOperations(acc int, coll [][]string) int {
	if len(coll) == 0 {
		return acc
	}

	operation := operations[coll[0][1]]
	number, _ := strconv.Atoi(coll[0][2])

	return foldOperations(operation(acc, number), coll[1:])
}

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
