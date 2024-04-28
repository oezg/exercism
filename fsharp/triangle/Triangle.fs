module Triangle

let isValid =
    function
    | [ 0.0; 0.0; 0.0 ] -> false
    | [ a; b; c ] when a < 0.0 || b < 0.0 || c < 0.0 -> false
    | [ a; b; c ] when a + b < c || b + c < a || a + c < b -> false
    | [ _; _; _ ] -> true
    | _ -> false

let distinctSides sides = List.distinct sides |> List.length

let equilateral triangle =
    isValid triangle && (distinctSides triangle = 1)

let isosceles triangle =
    isValid triangle && distinctSides triangle < 3

let scalene triangle =
    isValid triangle && distinctSides triangle = 3
