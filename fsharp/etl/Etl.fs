module Etl

let transform: Map<int, char list> -> Map<char, int> =
    // Prepare the map before the inversion by converting the chars to lowercase
    Map.fold (fun acc score letters -> Map.add score (List.map System.Char.ToLower letters) acc) Map.empty
    >> MapInversion.invertListResult
    >> Result.defaultValue Map.empty
