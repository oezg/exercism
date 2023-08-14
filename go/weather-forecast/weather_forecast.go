// Package weather provides tools to forecast
// the current weather condition in a city.
package weather

// CurrentCondition stores the current weather condition in a location.
var CurrentCondition string
// CurrentLocation stores the current location.
var CurrentLocation string

// Forecast takes two string parameters, assigns them to the CurrentLocation and CurrentCondition
// variables and returns a string giving information about the current weather condition in the 
// given city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
