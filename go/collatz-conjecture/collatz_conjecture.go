package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n < 1 {
		return 0, errors.New("n must be positive")
	}
	var step int
	for n > 1 {
		step++
		if n&1 == 0 {
			n >>= 1
		} else {
			n = n*3 + 1
		}
	}
	return step, nil
}
