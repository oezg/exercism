// Package elon defines methods on Car type to drive the car,
// display distance travelled and battery charge, as well as
// check if the car can finish a race track with its battery.
package elon

import "fmt"

// Drive updates the number of meters driven based on the car's speed,
// and reduces the battery according to the battery drainage
func (car *Car) Drive() {
	if car.battery >= car.batteryDrain {
		car.battery -= car.batteryDrain
		car.distance += car.speed
	}
}

// DisplayDistance returns the distance as displayed on the LED display.
func (car Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", car.distance)
}

// DisplayBattery returns the battery percentage as displayed on the LED display.
func (car Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", car.battery)
}

// CanFinish takes a trackDistance int as its parameter and returns true
// if the car can finish the race; otherwise, returns false.
func (car Car) CanFinish(trackDistance int) bool {
	return trackDistance <= car.speed*(car.battery/car.batteryDrain)
}
