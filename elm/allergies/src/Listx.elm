module Listx exposing (..)


find_index : (a -> Bool) -> List a -> Maybe Int
find_index predicate list =
    let
        find_index_help idx inner_list =
            case inner_list of
                [] ->
                    Nothing

                hd :: tl ->
                    if predicate hd then
                        Just idx

                    else
                        find_index_help (idx + 1) tl
    in
    find_index_help 0 list


index : a -> List a -> Maybe Int
index element list =
    find_index (\x -> x == element) list
