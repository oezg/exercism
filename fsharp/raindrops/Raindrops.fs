module Raindrops

let convert (number: int): string =
    let plings =     
        [ 3, "Pling"; 5, "Plang"; 7, "Plong" ]
        |> List.filter (fun (n, pling) -> number % n = 0)
        |> List.map snd
        |> String.concat ""
    if plings.Length = 0 then 
        number.ToString()
    else
        plings