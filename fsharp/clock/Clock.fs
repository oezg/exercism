module Clock

[<Measure>]
type minute

type Clock = Clock of int<minute>

[<Literal>]
let private hourMinutes: int<minute> = 60<minute>

[<Literal>]
let private dayMinutes: int<minute> = 24 * hourMinutes

let add (minutes: int) (Clock m) : Clock =
    let modulo (m: int<minute>) (n: int<minute>) : int<minute> = (n % m + m) % m
    minutes * 1<minute> + m |> modulo dayMinutes |> Clock

let create (hours: int) (minutes: int) : Clock =
    Clock 0<minute> |> add (hours * 60 + minutes)

let subtract (minutes: int) : (Clock -> Clock) = add -minutes

let display (Clock m) : string =
    $"%02d{m / hourMinutes}:%02d{m % hourMinutes}"
