// Package airportrobot provides an interface to greet passengers in
// different languages. A learning exercise about interfaces
package airportrobot

import "fmt"

// Greeter is an interface to greet passengers in their language.
type Greeter interface {
	LanguageName() string
	Greet(visitorsName string) string
}

// SayHello accepts the name of the visitor and anything that implements
// the Greeter interface as arguments and returns the desired greeting string.
// For example, imagine a German Greeter implementation for which
// LanguageName returns "German" and Greet returns "Hallo {name}!"
func SayHello(visitorsName string, greeter Greeter) string {
	return fmt.Sprintf("I can speak %s: %s", greeter.LanguageName(), greeter.Greet(visitorsName))
}

type Italian struct{}

func (Italian) LanguageName() string {
	return "Italian"
}

func (Italian) Greet(visitorsName string) string {
	return fmt.Sprintf("Ciao %s!", visitorsName)
}

type Portuguese struct{}

func (Portuguese) LanguageName() string {
	return "Portuguese"
}

func (Portuguese) Greet(visitorsName string) string {
	return fmt.Sprintf("Olá %s!", visitorsName)
}
