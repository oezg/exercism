module Accumulate


let rec helper func source target = 
    match source with
    | [] -> target
    | head :: tail -> helper func tail (func head :: target)

let rec reverser target source =
    match source with
    | [] -> target
    | head :: tail -> reverser (head :: target) tail

let rec accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    helper func input []
    |> reverser []