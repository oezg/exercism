// Package sorting is a learning exercise for type conversion, type assertion and type switching.
package sorting

import (
	"fmt"
	"strconv"
)

// DescribeNumber returns a string describing the number.
func DescribeNumber(f float64) string {
	return fmt.Sprintf("This is the number %0.1f", f)
}

type NumberBox interface {
	Number() int
}

// DescribeNumberBox returns a string describing the NumberBox.
func DescribeNumberBox(nb NumberBox) string {
	return fmt.Sprintf("This is a box containing the number %0.1f", float64(nb.Number()))
}

type FancyNumber struct {
	n string
}

func (i FancyNumber) Value() string {
	return i.n
}

type FancyNumberBox interface {
	Value() string
}

// ExtractFancyNumber returns the integer value for a FancyNumber
// and 0 if any other FancyNumberBox is supplied.
func ExtractFancyNumber(fnb FancyNumberBox) int {
	fn, ok := fnb.(FancyNumber)
	if !ok {
		return 0
	}
	number, err := strconv.Atoi(fn.Value())
	if err != nil {
		return 0
	}
	return number
}

// DescribeFancyNumberBox returns a string describing the FancyNumberBox.
func DescribeFancyNumberBox(fnb FancyNumberBox) string {
	return fmt.Sprintf("This is a fancy box containing the number %0.1f", float64(ExtractFancyNumber(fnb)))
}

// DescribeAnything returns a string describing whatever it contains.
func DescribeAnything(i interface{}) string {
	switch v := i.(type) {
	case int:
		return DescribeNumber(float64(v))
	case float64:
		return DescribeNumber(v)
	case NumberBox:
		return DescribeNumberBox(v)
	case FancyNumberBox:
		return DescribeFancyNumberBox(v)
	default:
		return "Return to sender"
	}
}
