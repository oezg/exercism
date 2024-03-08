module Darts

let score (x: double) (y: double) : int =
    match sqrt (x ** 2 + y ** 2) with
    | innerCircle when innerCircle <= 1.0 -> 10
    | middleCircle when middleCircle <= 5.0 -> 5
    | outerCircle when outerCircle <= 10.0 -> 1
    | _ -> 0
