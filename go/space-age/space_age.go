// Package space provides a utility Age function to calculate someone's
// age on another planet.
package space

// Planet is a custom type that represents the name of planets.
type Planet string

// SecondsInYear is a constant for the number of seconds in one Earth year.
const SecondsInYear = 31557600

// Age calculates how old someone would be on a given planet and age.
// The argument in seconds and the return type for age is float64
func Age(seconds float64, planet Planet) float64 {
	planets := map[Planet]float64{
		"Mercury": 0.2408467,
		"Venus":   0.61519726,
		"Earth":   1.0,
		"Mars":    1.8808158,
		"Jupiter": 11.862615,
		"Saturn":  29.447498,
		"Uranus":  84.016846,
		"Neptune": 164.79132,
	}

	period, ok := planets[planet]
	if !ok {
		return -1
	}

	return seconds / (period * SecondsInYear)
}
