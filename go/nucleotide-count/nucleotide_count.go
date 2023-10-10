// Package dna provides utilities to count the frequency of nucleotides in DNA.
package dna

import (
	"errors"
)

// Histogram is a mapping from nucleotide to its count in given DNA.
type Histogram map[rune]int

// DNA is a sequence of nucleotides.
type DNA string

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (Histogram, error) {
	h := Histogram{
		'A': 0,
		'C': 0,
		'G': 0,
		'T': 0,
	}

	for _, nucleotide := range d {
		if _, ok := h[nucleotide]; !ok {
			return nil, errors.New("invalid nucleotide")
		}

		h[nucleotide]++
	}

	return h, nil
}
