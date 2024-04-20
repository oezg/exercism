module Darts

[<Literal>]
let InnerRadius = 1.0

[<Literal>]
let MiddleRadius = 5.0

[<Literal>]
let OuterRadius = 10.0


let score (x: double) (y: double) : int =
    match sqrt (x ** 2 + y ** 2) with
    | innerCircle when innerCircle <= InnerRadius -> 10
    | middleCircle when middleCircle <= MiddleRadius -> 5
    | outerCircle when outerCircle <= OuterRadius -> 1
    | _ -> 0
