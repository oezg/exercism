module Clock

[<Measure>]
type minute

type Clock = Clock of int<minute>

let private minutesPerHour = 60<minute>
let private minutesPerDay = 24 * minutesPerHour

let private convertMinutesToClock =
    let modulo m n = (n % m + m) % m
    modulo minutesPerDay >> Clock

let private toMinute minutes = minutes * 1<minute>

let private joinToClock minutes =
    toMinute >> (+) minutes >> convertMinutesToClock

let private hoursToMinutes h = h * minutesPerHour

let private join (Clock m) = joinToClock m

let create = hoursToMinutes >> joinToClock

let add minutes clock = join clock minutes

let subtract minutes = add -minutes

let display (Clock m) =
    $"%02d{m / minutesPerHour}:%02d{m % minutesPerHour}"
