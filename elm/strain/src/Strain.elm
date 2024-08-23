module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate =
    let
        elm acc coll =
            case coll of
                [] ->
                    List.reverse acc

                x :: xs ->
                    elm
                        (if predicate x then
                            x :: acc

                         else
                            acc
                        )
                        xs
    in
    elm []


discard : (a -> Bool) -> List a -> List a
discard predicate =
    predicate >> not |> keep
