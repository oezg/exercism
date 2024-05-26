module MapInversion

(* Generic map inversion with Result *)

let invertResult<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Result<Map<'V, 'K>, string> =
    Map.fold
        (fun state key value ->
            Result.bind
                (fun acc ->
                    match Map.tryFind value acc with
                    | None -> Ok(Map.add value key acc)
                    | Some existing -> Error($"{value} is mapped to {existing} and {key}"))
                state)
        (Ok Map.empty)

let invertListResult<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Result<Map<'V, 'K>, string> =
    Map.fold
        (fun statePerKey key ->
            List.fold
                (fun statePerValue value ->
                    Result.bind
                        (fun acc ->
                            match Map.tryFind value acc with
                            | None -> Ok(Map.add value key acc)
                            | Some existing -> Error($"{value} is mapped to {existing} and {key}"))
                        statePerValue)
                statePerKey)
        (Ok Map.empty)


(* Generic higher-order map inversion with handler function *)

let invertFunc<'K, 'V when 'K: comparison and 'V: comparison>
    (handler: 'K -> 'K -> 'V -> 'K option)
    : Map<'K, 'V> -> Map<'V, 'K> =
    Map.fold
        (fun acc key value ->
            Map.change
                value
                (function
                | None -> Some key
                | Some existing -> handler existing key value)
                acc)
        Map.empty

let invertListFunc<'K, 'V when 'K: comparison and 'V: comparison>
    (handler: 'K -> 'K -> 'V -> 'K option)
    : Map<'K, 'V list> -> Map<'V, 'K> =
    Map.fold
        (fun statePerKey key ->
            List.fold
                (fun statePerValue value ->
                    Map.change
                        value
                        (function
                        | None -> Some key
                        | Some existing -> handler existing key value)
                        statePerValue)
                statePerKey)
        Map.empty

(* Helpers *)

let private omitKey (existing: 'K) (key: 'K) (value: 'V) : 'K option = None
let private updateKey (existing: 'K) (key: 'K) (value: 'V) : 'K option = Some key
let private keepExisting (existing: 'K) (key: 'K) (value: 'V) : 'K option = Some existing

let private keepMaximum (existing: 'K) (key: 'K) (value: 'V) : 'K option =
    if existing < key then Some key else Some existing

let private keepMinimum (existing: 'K) (key: 'K) (value: 'V) : 'K option =
    if existing > key then Some key else Some existing

let private throwException (existing: 'K) (key: 'K) (value: 'V) : 'K option =
    failwith $"{value} is mapped to {existing} and {key}"


let invertOmit<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Map<'V, 'K> =
    invertFunc omitKey

let invertUpdate<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Map<'V, 'K> =
    invertFunc updateKey

let invertKeep<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Map<'V, 'K> =
    invertFunc keepExisting

let invertMax<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Map<'V, 'K> =
    invertFunc keepMaximum

let invertMin<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Map<'V, 'K> =
    invertFunc keepMinimum

let invertThrow<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V> -> Map<'V, 'K> =
    invertFunc throwException


let invertListOmit<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertListFunc omitKey

let invertListUpdate<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertListFunc updateKey

let invertListKeep<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertListFunc keepExisting

let invertListMax<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertListFunc keepMaximum

let invertListMin<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertListFunc keepMinimum

let invertListThrow<'K, 'V when 'K: comparison and 'V: comparison> : Map<'K, 'V list> -> Map<'V, 'K> =
    invertListFunc throwException
