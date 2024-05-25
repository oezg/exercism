module Etl

let transform: Map<int, char list> -> Map<char, int> =
    Map.fold (fun acc score letters -> Map.add score (List.map System.Char.ToLower letters) acc) Map.empty
    >> MapInversion.invertResult
    >> Result.defaultValue Map.empty
