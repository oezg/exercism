module HighScores

let scores (values: int list) : int list = values

let latest (values: int list) : int = List.last values

let personalBest (values: int list) : int = List.head (List.sortDescending values)

let personalTopThree (values: int list) : int list =
    List.truncate 3 (List.sortDescending values)
