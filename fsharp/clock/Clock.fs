module Clock

[<Measure>]
type minute

type Clock = Clock of int<minute>

let minutesPerHour = 60<minute>
let minutesPerDay = 24 * minutesPerHour

let private convertMinutesToClock =
    let modulo m n = (n % m + m) % m
    modulo minutesPerDay >> Clock

let private toMinute minutes = minutes * 1<minute>

let create hours =
    toMinute >> (+) (hours * minutesPerHour) >> convertMinutesToClock

let add minutes (Clock m) =
    m + (toMinute minutes) |> convertMinutesToClock

let subtract minutes = add -minutes

let display (Clock m) =
    $"%02d{m / minutesPerHour}:%02d{m % minutesPerHour}"
