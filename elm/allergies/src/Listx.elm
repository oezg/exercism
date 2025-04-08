module Listx exposing (..)


findIndex : (a -> Bool) -> List a -> Maybe Int
findIndex predicate list =
    let
        helpFindIndex idx innerList =
            case innerList of
                [] ->
                    Nothing

                hd :: tl ->
                    if predicate hd then
                        Just idx

                    else
                        helpFindIndex (idx + 1) tl
    in
    helpFindIndex 0 list


index : a -> List a -> Maybe Int
index element list =
    findIndex (\x -> x == element) list
