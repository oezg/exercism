module Triangle

let private triangleWithDistinctSides sides triangle =
    match triangle with
    | [ a; b; c ] -> a > 0. && b > 0. && c > 0. && a + b >= c && b + c >= a && a + c >= b
    | _ -> false
    && List.exists (fun n -> triangle |> List.distinct |> List.length = n) sides

let equilateral = triangleWithDistinctSides (List.singleton 1)

let isosceles = triangleWithDistinctSides ([ 1; 2 ])

let scalene = triangleWithDistinctSides (List.singleton 3)
