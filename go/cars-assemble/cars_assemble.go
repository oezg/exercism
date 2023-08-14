package cars

const (
	groupsOfTenPrice = 95000
	individualPrice  = 10000
)

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	rate := float64(productionRate) / 100.0
	return rate * successRate
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	carsPerHour := CalculateWorkingCarsPerHour(productionRate, successRate)
	carsPerMinute := int(carsPerHour) / 60
	return carsPerMinute
}

// CalculateCost works out the cost of producing the given number of cars
func CalculateCost(carsCount int) uint {
	groupsOfTen := carsCount / 10
	remainder := carsCount % 10
	cost := uint(groupsOfTen) * groupsOfTenPrice
	cost += uint(remainder) * individualPrice
	return cost
}
