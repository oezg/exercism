module Accumulate

let rec applier func acc input =
    match input with
    | [] -> acc
    | head :: tail -> applier func (func head :: acc) tail


let accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    
    input 
    |> applier func []
    |> applier id []