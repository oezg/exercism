module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    let
        normalized =
            String.toLower >> String.toList >> List.sort

        anagram candidate =
            let
                sameWhen process =
                    process word == process candidate
            in
            sameWhen normalized && not (sameWhen String.toLower)
    in
    List.filter anagram candidates
