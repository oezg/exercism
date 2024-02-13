module SpaceAge

open FSharp.Data.UnitSystems.SI.UnitNames

[<Measure>]
type year

type Planet =
    | Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

let orbitalPeriod =
    function
    | Mercury -> 0.2408467<year>
    | Venus -> 0.61519726<year>
    | Earth -> 1.0<year>
    | Mars -> 1.8808158<year>
    | Jupiter -> 11.862615<year>
    | Saturn -> 29.447498<year>
    | Uranus -> 84.016846<year>
    | Neptune -> 164.79132<year>

let private earthYearInSeconds = 31557600.0<second/year>

let private toYearOnEarth (seconds: int64): float<year> =
    float seconds * 1.0<second> / earthYearInSeconds

let private toYearOnPlanet (planet: Planet) (year: float<year>): float =
    year / orbitalPeriod planet

let age (planet: Planet) (seconds: int64): float =
    seconds
    |> toYearOnEarth
    |> toYearOnPlanet planet
