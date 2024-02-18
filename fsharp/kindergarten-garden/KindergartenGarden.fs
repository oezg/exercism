module KindergartenGarden

open System

type Plant =
    | Violets
    | Grass
    | Radishes
    | Clover
    | Invalid

let get_plant letter = 
    match letter with
    | 'V' -> Violets
    | 'G' -> Grass
    | 'R' -> Radishes
    | 'C' -> Clover
    | _ -> Invalid

let students = 
    "Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry".Split(", ")
    |> Array.mapi (fun index name -> (name, index)) 
    |> Map.ofArray

let plants (diagram: string) student =
    let rows = diagram.Split('\n')
    let letters = (2 * students[student])
    [for row in rows do
        for letter in row[letters..(letters+1)] do
            get_plant letter
    ]
