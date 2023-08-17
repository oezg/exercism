package lasagna

// PreparationTime estimates how long the preparation will take.
func PreparationTime(layers []string, avgTimePerLayer int) int {
	if avgTimePerLayer == 0 {
		avgTimePerLayer = 2
	}
	return len(layers) * avgTimePerLayer
}

// Quantities determines the quantity of noodles and sauce needed.
func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		if layer == "noodles" {
			noodles += 50
		} else if layer == "sauce" {
			sauce += 0.2
		}
	}
	return
}

// AddSecretIngredient accepts two string slices as parameters
// replaces the last element in the second slice with the last
// element from the first slice.
func AddSecretIngredient(friendsList, myList []string) {
	secretIngredient := friendsList[len(friendsList)-1]
	myList[len(myList)-1] = secretIngredient
}

// ScaleRecipe calculates the amounts for different numbers of portions.
func ScaleRecipe(quantitiesForTwo []float64, numberOfPortions int) []float64 {
	quantities := make([]float64, len(quantitiesForTwo))
	for i, quantity := range quantitiesForTwo {
		quantities[i] = quantity / 2 * float64(numberOfPortions)
	}
	return quantities
}
