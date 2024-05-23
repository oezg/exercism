module Etl

let private addLetterToMap (score: int) (sourceMap: Map<char, int>) (letter: char) : Map<char, int> =
    Map.change
        (System.Char.ToLowerInvariant letter)
        (function
        | None -> Some score
        | _ -> failwithf "Letter '%c' is assigned more than one score" letter)
        sourceMap

let private mapValuesToKey
    (lettersToScores: Map<char, int>)
    (KeyValue(score: int, letters: char list))
    : Map<char, int> =
    List.fold (addLetterToMap score) lettersToScores letters

let transform: Map<int, char list> -> Map<char, int> =
    Seq.fold mapValuesToKey Map.empty
