// Package darts defines a method that returns the
// earned points in a single toss of a Darts game.
// If the dart lands outside the target, player earns no points (0 points).
// If the dart lands in the outer circle with radius 10, player earns 1 point.
// If the dart lands in the middle circle with radius 5, player earns 5 points.
// If the dart lands in the inner circle with radius 1, player earns 10 points.
package darts

import "math"

// Score returns the correct amount earned by a dart landing at the given point.
func Score(x, y float64) int {
	return dartsScore(radius(x, y))
}

// darts_score returns the score corresponding to a certain distance from target.
func dartsScore(r float64) int {
	if r > 10 {
		return 0
	}

	if r > 5 {
		return 1
	}

	if r > 1 {
		return 5
	}

	return 10
}

// radius calculates the distance from origin of a given point
func radius(x, y float64) float64 {
	return math.Sqrt(x*x + y*y)
}
