package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) (totalBirds int) {
	for _, birdsCount := range birdsPerDay {
		totalBirds += birdsCount
	}
	return
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) (weekTotal int) {
	startOfWeek, endOfWeek := (week-1)*7, week*7
	for i := startOfWeek; i < endOfWeek; i++ {
		weekTotal += birdsPerDay[i]
	}
	return
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i += 2 {
		birdsPerDay[i]++
	}
	return birdsPerDay
}
