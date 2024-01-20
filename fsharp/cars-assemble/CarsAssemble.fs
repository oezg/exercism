module CarsAssemble

let CARS_PER_HOUR = 221

let successRate (speed: int): float =
    if speed < 5 then 
        1.0
    elif speed < 9 then
        0.9
    elif speed < 10 then
        0.8
    else
        0.77

let productionRatePerHour (speed: int): float =
    float(CARS_PER_HOUR) * float(speed) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int(productionRatePerHour speed) / 60
