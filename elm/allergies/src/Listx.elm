module Listx exposing (..)


findIndex : (a -> Bool) -> List a -> Maybe Int
findIndex predicate list =
    let
        findIndexHelp idx innerList =
            case innerList of
                [] ->
                    Nothing

                hd :: tl ->
                    if predicate hd then
                        Just idx

                    else
                        findIndexHelp (idx + 1) tl
    in
    findIndexHelp 0 list


index : a -> List a -> Maybe Int
index element list =
    findIndex (\x -> x == element) list
