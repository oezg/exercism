// Package wordy parses and evaluates simple math word problems returning the answer as an integer.
package wordy

import (
	"regexp"
	"strconv"
)

const (
	pattern = ` (plus|minus|multiplied by|divided by) (-?\d+)`
	// A repeated capturing group will only capture the last iteration.
	// Put a capturing group around the repeated group to capture all iterations.
	patternHead = `What is (-?\d+)((` + pattern + `)*)\?`
	patternRest = pattern + "(.*)"
)

var (
	rexpHead = regexp.MustCompile(patternHead)
	rexpRest = regexp.MustCompile(patternRest)
)

// Answer returns the integer result of the operation given in the question.
// Parser rejects unsupported operations and invalid syntax.
func Answer(question string) (int, bool) {
	data := rexpHead.FindStringSubmatch(question)
	if len(data) == 0 {
		return 0, false
	}

	head, _ := strconv.Atoi(data[1])
	return rechelp(head, data[2]), true
}

func rechelp(head int, data string) int {
	if data == "" {
		return head
	}

	rest := rexpRest.FindStringSubmatch(data)
	operand, _ := strconv.Atoi(rest[2])
	current := calculate(head, rest[1], operand)
	return rechelp(current, rest[3])
}

func calculate(current int, operation string, operand int) int {
	switch operation {
	case "plus":
		return current + operand
	case "minus":
		return current - operand
	case "multiplied by":
		return current * operand
	case "divided by":
		return current / operand
	default:
		return current
	}
}

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
