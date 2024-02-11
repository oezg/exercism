module Raindrops

let convert (number: int): string =
    [ 3, "Pling"; 5, "Plang"; 7, "Plong" ]
    |> List.choose (fun (n, pl) -> if number % n = 0 then Some pl else None)
    |> function
        | [] -> number.ToString()
        | plings -> String.concat "" plings
