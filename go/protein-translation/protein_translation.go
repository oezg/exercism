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

		if errors.Is(err, ErrInvalidBase) {
			return nil, ErrInvalidBase
		}

		if errors.Is(err, ErrStop) {
			break
		}

		protein = append(protein, aminoAcid)
	}

	return protein, nil
}

// FromCodon returns the protein corresponding to the given 3-Base-Codon.
func FromCodon(codon string) (string, error) {
	switch codon {
	case "UCU", "UCC", "UCA", "UCG":
		return "Serine", nil
	case "UAA", "UAG", "UGA":
		return "", ErrStop
	case "UUU", "UUC":
		return "Phenylalanine", nil
	case "UUA", "UUG":
		return "Leucine", nil
	case "UAU", "UAC":
		return "Tyrosine", nil
	case "UGU", "UGC":
		return "Cysteine", nil
	case "AUG":
		return "Methionine", nil
	case "UGG":
		return "Tryptophan", nil
	default:
		return "", ErrInvalidBase
	}
}

// 1 SWITCH
// BenchmarkCodon-4        56622124                20.42 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1756344               660.7 ns/op           384 B/op         11 allocs/op

// 2 MAP
// BenchmarkCodon-4         7364150               155.3 ns/op             0 B/op          0 allocs/op
// BenchmarkProtein-4       1377252              1001 ns/op             384 B/op         11 allocs/op

// 3 Switch with naked return
// BenchmarkCodon-4        50637979                21.48 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1799146               649.9 ns/op           384 B/op         11 allocs/op

// 4 named return variables
// BenchmarkCodon-4        53022634                21.36 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1768119               677.7 ns/op           384 B/op         11 allocs/op

// 5 error comparison with errors.Is
// BenchmarkCodon-4        54122398                20.27 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1270966               987.9 ns/op           384 B/op         11 allocs/op

// 6 unnamed return variables
// BenchmarkCodon-4        56983788                20.25 ns/op            0 B/op          0 allocs/op
// BenchmarkProtein-4       1261290               993.8 ns/op           384 B/op         11 allocs/op

// goos: linux
// goarch: amd64
// pkg: protein
// cpu: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
