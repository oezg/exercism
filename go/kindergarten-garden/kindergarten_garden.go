// Package kindergarten represents a kindergarten where the children have put
// little cups along the window sills and planted one type of plant in each cup.
package kindergarten

import (
	"errors"
	"slices"
	"strings"
)

// Garden represents the children and their plants.
type Garden struct {
	children map[string][]string
}

// NewGarden returns a pointer to a new garden or an error, given the cups and the children.
func NewGarden(diagram string, children []string) (*Garden, error) {
	rows := strings.Split(diagram, "\n")
	if rows[0] != "" || len(rows) < 3 || len(rows[1]) != len(children)*2 {
		return nil, errors.New("wrong diagram format")
	}

	if len(rows[1]) != len(rows[2]) {
		return nil, errors.New("mismatched rows")
	}

	if len(rows[1])%2 == 1 {
		return nil, errors.New("odd number of cups")
	}

	childrensPlants := make(map[string][]string, len(children))

	sortedChildren := append([]string{}, children...)
	slices.Sort(sortedChildren)

	for i, v := range sortedChildren {
		if _, ok := childrensPlants[v]; ok {
			return nil, errors.New("duplicate name")
		}

		cups := []byte{rows[1][i*2], rows[1][i*2+1], rows[2][i*2], rows[2][i*2+1]}

		fourPlants, err := cupsToPlants(cups)
		if err != nil {
			return nil, err
		}

		childrensPlants[v] = fourPlants
	}

	return &Garden{childrensPlants}, nil
}

// Plants returns the plants of the given child or false.
func (g *Garden) Plants(child string) ([]string, bool) {
	plants, ok := g.children[child]
	return plants, ok
}

var cupToPlant = map[byte]string{
	'R': "radishes",
	'C': "clover",
	'G': "grass",
	'V': "violets",
}

func cupsToPlants(cups []byte) ([]string, error) {
	out := make([]string, 4)

	for i, v := range cups {
		if plant, ok := cupToPlant[v]; !ok {
			return nil, errors.New("invalid cup code" + string(v))
		} else {
			out[i] = plant
		}
	}

	return out, nil
}

// BenchmarkNewGarden-4      143058              8097 ns/op            6467 B/op         77 allocs/op
