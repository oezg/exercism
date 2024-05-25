module MapInversion

(* Generic higher-order map inversion with handler function *)

let private valueWithFunc
    (handle: 'K -> 'K -> 'V -> 'K option)
    (key: 'K)
    (source: Map<'V, 'K>)
    (value: 'V)
    : Map<'V, 'K> =
    Map.change
        value
        (function
        | None -> Some key
        | Some existing -> handle existing key value)
        source

let private valuesIntoFunc
    (handler: 'K -> 'K -> 'V -> 'K option)
    (source: Map<'V, 'K>)
    (key: 'K)
    (values: 'V seq)
    : Map<'V, 'K> =
    Seq.fold (valueWithFunc handler key) source values

let invertFunc (handler: 'K -> 'K -> 'V -> 'K option) (source: Map<'K, 'V list>) : Map<'V, 'K> =
    Map.fold (valuesIntoFunc handler) Map.empty source


(* Helpers *)

let private omitKey (existing: 'K) (key: 'K) (value: 'V) : 'K option = None
let private updateKey (existing: 'K) (key: 'K) (value: 'V) : 'K option = Some key
let private keepExisting (existing: 'K) (key: 'K) (value: 'V) : 'K option = Some existing

let private keepMaximum (existing: 'K) (key: 'K) (value: 'V) : 'K option =
    if existing < key then Some key else Some existing

let private keepMinimum (existing: 'K) (key: 'K) (value: 'V) : 'K option =
    if existing > key then Some key else Some existing

let private throwException (existing: 'K) (key: 'K) (value: 'V) : 'K option =
    failwithf "Key %A is associated with values %A and %A" value existing key

let invertOmitting<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertFunc omitKey

let invertUpdating<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertFunc updateKey

let invertKeeping<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertFunc keepExisting

let invertMax<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertFunc keepMaximum

let invertMin<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertFunc keepMinimum

let invertThrowing<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertFunc throwException


(* Generic map inversion with Result *)

let private valuesWithResult (key: 'K) (source: Result<Map<'V, 'K>, string>) (value: 'V) : Result<Map<'V, 'K>, string> =
    match source with
    | Ok table ->
        match Map.tryFind value table with
        | None -> Ok(Map.add value key table)
        | Some existing -> Error(sprintf "Key %A is associated with values %A and %A" value existing key)
    | Error err -> Error err

let private valuesIntoResult
    (source: Result<Map<'V, 'K>, string>)
    (key: 'K)
    (values: 'V seq)
    : Result<Map<'V, 'K>, string> =
    Seq.fold (valuesWithResult key) source values

let invertResult (source: Map<'K, 'V seq>) : Result<Map<'V, 'K>, string> =
    Map.fold valuesIntoResult (Ok Map.empty) source
