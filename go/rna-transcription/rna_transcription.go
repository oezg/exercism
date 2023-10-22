// Package strand provides utility to convert DNA strand to its complementary RNA
package strand

import (
	"fmt"
	"strings"
)

// ToRNA returns the RNA complement of a given DNA sequence.
func ToRNA(dna string) string {
	sb := strings.Builder{}

	for i, nucleotide := range dna {
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
			return fmt.Sprintf("%c at the position %d is not a DNA nucleotide", nucleotide, i)
		}
	}

	return sb.String()
}
