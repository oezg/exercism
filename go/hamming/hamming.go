package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("strings must have equal length")
	}
	var hamming int
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			hamming++
		}
	}
	return hamming, nil
}
