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

let invertOmitting<'K, 'V> = invertFunc omitKey
let invertUpdating<'K, 'V> = invertFunc updateKey
let invertKeeping<'K, 'V> = invertFunc keepExisting
let invertMax<'K, 'V> = invertFunc keepMaximum
let invertMin<'K, 'V> = invertFunc keepMinimum
let invertThrowing<'K, 'V> = invertFunc throwException


(* Generic map inversion with Result *)

let private valuesWithResult (key: 'K) (source: Result<Map<'V, 'K>, string>) (value: 'V) : Result<Map<'V, 'K>, string> =
    match source with
    | Ok table ->
        if Map.containsKey value table then
            Error(sprintf "Duplicate map key: %A" value)
        else
            Ok(Map.add value key table)
    | Error err -> Error err

let private valuesIntoResult
    (source: Result<Map<'V, 'K>, string>)
    (key: 'K)
    (values: 'V list)
    : Result<Map<'V, 'K>, string> =
    List.fold (valuesWithResult key) source values

let invertResult (source: Map<'K, 'V list>) : Result<Map<'V, 'K>, string> =
    Map.fold valuesIntoResult (Ok Map.empty) source
