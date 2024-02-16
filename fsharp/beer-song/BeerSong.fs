module BeerSong

let private verse (cur: int) : string list =
    match cur with
    | 2 -> [
        "2 bottles of beer on the wall, 2 bottles of beer."
        "Take one down and pass it around, 1 bottle of beer on the wall."
        ]
    | 1 -> [
        "1 bottle of beer on the wall, 1 bottle of beer."
        "Take it down and pass it around, no more bottles of beer on the wall."
        ]   
    | 0 -> [
        "No more bottles of beer on the wall, no more bottles of beer."
        "Go to the store and buy some more, 99 bottles of beer on the wall."
        ]
    | _ -> [
        sprintf "%d bottles of beer on the wall, %d bottles of beer." cur cur
        sprintf "Take one down and pass it around, %d bottles of beer on the wall." (cur - 1)
        ]

let recite (startBottles: int) (takeDown: int) = 
    let rec helper (acc: string list) (cur: int) (rem: int): string list =
        match rem with
        | 0 -> acc
        | 1 -> acc @ verse cur
        | _ -> helper (acc @ verse cur @ [""]) (cur - 1) (rem - 1)
    helper [] startBottles takeDown