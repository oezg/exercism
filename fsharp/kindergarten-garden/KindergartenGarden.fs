module KindergartenGarden

type Plant = Violets | Grass | Radishes | Clover

let private getPlant = function
    | 'V' -> Some Violets
    | 'G' -> Some Grass
    | 'R' -> Some Radishes
    | 'C' -> Some Clover
    | _ -> None

let private students =
    "Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry".Split ", "
    |> Array.mapi (fun index name -> (name, index))
    |> dict

let plants (diagram: string) student =
    diagram.Split '\n'
    |> Seq.collect (Seq.skip (2 * students[student]) >> Seq.take 2)
    |> Seq.choose getPlant
    |> List.ofSeq
