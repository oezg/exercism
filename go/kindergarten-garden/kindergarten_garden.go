// Package kindergarten represents a kindergarten where the children have put
// little cups along the window sills and planted one type of plant in each cup.
package kindergarten

import (
	"errors"
	"fmt"
	"sort"
	"strings"
)

// Garden represents the children and their plants.
type Garden struct {
	children map[child][]plant
}

type child = string

type plant = string

type cup = rune

var cupToPlant = map[cup]plant{
	'R': "radishes",
	'C': "clover",
	'G': "grass",
	'V': "violets",
}

func cupsToPlants(cups []cup) ([]plant, error) {
	out := make([]plant, 0, 4)

	for _, v := range cups {
		plant, ok := cupToPlant[v]
		if !ok {
			return nil, fmt.Errorf("invalid cup code: %c", v)
		}
		out = append(out, plant)
	}

	return out, nil
}

// NewGarden returns a pointer to a new garden or an error, given the cups and the children.
func NewGarden(diagram string, children []child) (*Garden, error) {
	lines := strings.Split(diagram, "\n")
	if lines[0] != "" || len(lines) != 3 || len(lines[1]) != len(children)*2 {
		return nil, errors.New("wrong diagram format")
	}

	if len(lines[1]) != len(lines[2]) {
		return nil, errors.New("mismatched rows")
	}

	if len(lines[1])%2 == 1 {
		return nil, errors.New("odd number of cups")
	}

	out := Garden{children: map[child][]plant{}}

	// To avoid sorting in place, first copy the slice to a new array.
	sortedChildren := make([]child, len(children))
	_ = copy(sortedChildren, children)
	sort.Strings(sortedChildren)

	for i, v := range sortedChildren {
		if _, ok := out.children[v]; ok {
			return nil, errors.New("duplicate name")
		}

		// TODO: find a nicer way to express the four cups
		cups := lines[1][i*2:i*2+2] + lines[2][i*2:i*2+2]
		fourPlants, err := cupsToPlants([]cup(cups))
		if err != nil {
			return nil, err
		}

		out.children[v] = fourPlants
	}

	return &out, nil
}

// Plants returns the plants of the given child or false.
func (g *Garden) Plants(child child) ([]plant, bool) {
	plants, ok := g.children[child]
	return plants, ok
}
