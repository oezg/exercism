module Accumulate

let accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    let rec applier func acc input =
        match input with
        | [] -> acc
        | head :: tail -> applier func (func head :: acc) tail
    
    input 
    |> applier func []
    |> applier id []