// Package etl provides a utility to change the way letters and their point values are stored.
//
// Currently, letters are stored in groups based on their score, in a one-to-many mapping.
// This needs to be changed to store each individual lower-case letter with its score
// in a one-to-one mapping.
package etl

import (
	"strings"
)

// Transform changes the data format of letters and their point values.
//
// Gotcha1: if a letter occurs more than once, it will be overwritten.
// Gothca2: it would be better to return an error for empty string, etc.
func Transform(in map[int][]string) map[string]int {
	out := make(map[string]int)
	for k, v := range in {
		for _, s := range v {
			out[strings.ToLower(s)] = k
		}
	}
	return out
}
