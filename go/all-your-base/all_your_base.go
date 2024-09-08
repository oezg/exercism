package allyourbase

import (
	"errors"
)

func ConvertToBase(inputBase int, inputDigits []int, outputBase int) ([]int, error) {
	if inputBase < 2 {
		return nil, errors.New("input base must be >= 2")
	}

	for _, v := range inputDigits {
		if v >= 0 && v < inputBase {
			continue
		}
		return nil, errors.New("all digits must satisfy 0 <= d < input base")
	}

	if outputBase < 2 {
		return nil, errors.New("output base must be >= 2")
	}

	decimal := reduceToDecimal(inputBase, inputDigits)

	return split(decimal, outputBase), nil
}

func split(n, base int) []int {
	length := log(n, base)

	out := make([]int, length)

	for i := length - 1; n > 0; i-- {
		out[i] = n % base
		n /= base
	}
	return out
}

func reduceToDecimal(base int, digits []int) int {
	out := 0
	p := len(digits) - 1
	for i, v := range digits {
		out += v * pow(base, p-i)
	}
	return out
}

func log(n, base int) int {
	if n == 0 {
		return 1
	}
	m := 0
	for n > 0 {
		n /= base
		m++
	}
	return m
}

func pow(n, exp int) int {
	if n == 0 {
		return 0
	}
	m := 1
	for exp > 0 {
		m *= n
		exp--
	}
	return m
}
