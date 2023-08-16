package blackjack

const (
	hit   = "H"
	split = "P"
	stand = "S"
	win   = "W"
)

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	var value int
	switch card {
	case "ace":
		value = 11
	case "two":
		value = 2
	case "three":
		value = 3
	case "four":
		value = 4
	case "five":
		value = 5
	case "six":
		value = 6
	case "seven":
		value = 7
	case "eight":
		value = 8
	case "nine":
		value = 9
	case "ten", "jack", "queen", "king":
		value = 10
	default:
		value = 0
	}
	return value
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	var decision string
	var value1, value2, dealer = ParseCard(card1), ParseCard(card2), ParseCard(dealerCard)
	switch {
	case value1+value2 == 22:
		decision = split
	case value1+value2 == 21 && dealer < 10:
		decision = win
	case value1+value2 > 16:
		decision = stand
	case value1+value2 > 11 && dealer < 7:
		decision = stand
	default:
		decision = hit
	}
	return decision
}
