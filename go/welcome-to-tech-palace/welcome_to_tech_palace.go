package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	return Wrap(Border(numStarsPerLine), welcomeMsg)
}

// Wrap wraps its first argument around its second argument separated by new lines
func Wrap(x string, y string) string {
	return x + "\n" + y + "\n" + x
}

// Border provides the border of asterisks with configurable length
func Border(num int) string {
	return strings.Repeat("*", num)
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	return strings.Trim(oldMsg, " *\n")
}
