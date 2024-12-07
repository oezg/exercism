type nucleotide = A | C | G | T

let hamming_distance (a: nucleotide list) (b: nucleotide list) =
  match (List.length a, List.length b) with
  | 0, 0 -> Ok 0
  | 0, _ -> Error "left strand must not be empty"
  | _, 0 -> Error "right strand must not be empty"
  | x, y when x <> y -> Error "left and right strands must be of equal length"
  | _ ->
    let distance =
      List.fold_left2 (fun acc x y -> acc + if x <> y then 1 else 0) 0 a b
    in
    Ok distance

