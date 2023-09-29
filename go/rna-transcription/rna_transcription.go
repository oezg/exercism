// Package strand provides utility to convert DNA strand to its complementary RNA
package strand

import (
	"log"
	"strings"
)

// ToRNA returns the RNA complement of a given DNA sequence.
func ToRNA(dna string) string {
	sb := strings.Builder{}

	for _, nucleotide := range dna {
		switch nucleotide {
		case 'G':
			sb.WriteRune('C')
		case 'C':
			sb.WriteRune('G')
		case 'T':
			sb.WriteRune('A')
		case 'A':
			sb.WriteRune('U')
		default:
			log.Fatalf("%c is not a DNA nucleotide", nucleotide)
		}
	}

	return sb.String()
}
