// Package dndcharacter is utility for generating character for a dnd game.
package dndcharacter

import (
	"math"
	"math/rand"
)

// Character represents a dnd game character.
type Character struct {
	Strength     int
	Dexterity    int
	Constitution int
	Intelligence int
	Wisdom       int
	Charisma     int
	Hitpoints    int
}

// Modifier calculates the ability modifier for a given ability score
func Modifier(score int) int {
	return int(math.Floor((float64(score) - 10) / 2))
}

// Ability uses randomness to generate the score for an ability
func Ability() int {
	minimum := 6
	roll := func() int {
		x := rand.Intn(6) + 1
		if x < minimum {
			minimum = x
		}
		return x
	}
	return roll() + roll() + roll() + roll() - minimum
}

// GenerateCharacter creates a new Character with random scores for abilities
func GenerateCharacter() Character {
	char := Character{Ability(), Ability(), Ability(), Ability(), Ability(), Ability(), 10}
	char.Hitpoints += Modifier(char.Constitution)
	return char
}
