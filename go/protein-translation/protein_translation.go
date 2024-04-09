// Package protein is a small utility to translate RNA sequences into proteins.
package protein

import (
	"errors"
)

const codonLength = 3

var (
	// ErrStop stops the protein translation.
	ErrStop error = errors.New("STOP Codon")
	// ErrInvalidBase is the message sent if the RNA is not formed well.
	ErrInvalidBase error = errors.New("invalid RNA")
)

// FromRNA returns the proteins that are coded by the given rna strand.
func FromRNA(rna string) ([]string, error) {
	strandLength := len(rna)

	if strandLength < codonLength || strandLength%codonLength != 0 {
		return nil, ErrInvalidBase
	}

	protein := []string{}

	for index := 0; index < strandLength; index += codonLength {
		aminoAcid, err := FromCodon(rna[index : index+codonLength])

		if err == ErrInvalidBase {
			return nil, ErrInvalidBase
		}

		if err == ErrStop {
			break
		}

		protein = append(protein, aminoAcid)
	}

	return protein, nil
}

// FromCodon returns the protein corresponding to the given 3-Base-Codon.
func FromCodon(codon string) (aminoAcid string, err error) {
	switch codon {
	case "UCU", "UCC", "UCA", "UCG":
		aminoAcid = "Serine"
	case "UAA", "UAG", "UGA":
		err = ErrStop
	case "UUU", "UUC":
		aminoAcid = "Phenylalanine"
	case "UUA", "UUG":
		aminoAcid = "Leucine"
	case "UAU", "UAC":
		aminoAcid = "Tyrosine"
	case "UGU", "UGC":
		aminoAcid = "Cysteine"
	case "AUG":
		aminoAcid = "Methionine"
	case "UGG":
		aminoAcid = "Tryptophan"
	default:
		err = ErrInvalidBase
	}
	return
}

// 1 SWITCH
// BenchmarkCodon-4        56622124                20.42 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1756344               660.7 ns/op           384 B/op         11 allocs/op

// 2 MAP
// BenchmarkCodon-4         7364150               155.3 ns/op             0 B/op          0 allocs/op
// BenchmarkProtein-4       1377252              1001 ns/op             384 B/op         11 allocs/op

// 3 Switch with named return
// BenchmarkCodon-4        50637979                21.48 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1799146               649.9 ns/op           384 B/op         11 allocs/op

// goos: linux
// goarch: amd64
// pkg: protein
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
