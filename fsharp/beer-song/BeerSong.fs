module BeerSong

let private verse cur =
    match cur with
    | 2 ->
        [ "2 bottles of beer on the wall, 2 bottles of beer."
          "Take one down and pass it around, 1 bottle of beer on the wall." ]
    | 1 ->
        [ "1 bottle of beer on the wall, 1 bottle of beer."
          "Take it down and pass it around, no more bottles of beer on the wall." ]
    | 0 ->
        [ "No more bottles of beer on the wall, no more bottles of beer."
          "Go to the store and buy some more, 99 bottles of beer on the wall." ]
    | _ ->
        [ $"{cur} bottles of beer on the wall, {cur} bottles of beer."
          $"Take one down and pass it around, {cur - 1} bottles of beer on the wall." ]

let recite (startBottles: int) (takeDown: int) =
    let rec helper acc cur rem =
        match rem with
        | 0 -> acc
        | 1 -> verse cur :: acc
        | _ -> helper ([ "" ] :: verse cur :: acc) (cur - 1) (rem - 1)

    helper [] startBottles takeDown |> List.rev |> List.concat
