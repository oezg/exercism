package gross

var units = map[string]int{
	"quarter_of_a_dozen": 3,
	"half_of_a_dozen":    6,
	"dozen":              12,
	"small_gross":        120,
	"gross":              144,
	"great_gross":        1728,
}

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return units
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	amount, exists := units[unit]
	if exists {
		bill[item] += amount
	}
	return exists
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) (removed bool) {
	if quantity, exists := GetItem(bill, item); exists {
		if amount, exists := units[unit]; exists {
			switch balance := quantity - amount; {
			case balance == 0:
				delete(bill, item)
				removed = true
			case balance > 0:
				bill[item] -= amount
				removed = true
			}
		}
	}
	return
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	quantity, exists := bill[item]
	return quantity, exists
}
