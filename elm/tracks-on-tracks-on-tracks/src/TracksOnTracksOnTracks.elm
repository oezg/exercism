module TracksOnTracksOnTracks exposing (..)


newList : List String
newList =
    []


existingList : List String
existingList =
    [ "Elm", "Clojure", "Haskell" ]


addLanguage : String -> List String -> List String
addLanguage =
    (::)


countLanguages : List String -> Int
countLanguages =
    List.length


reverseList : List String -> List String
reverseList =
    List.reverse


excitingList : List String -> Bool
excitingList languages =
    case languages of
        "Elm" :: _ ->
            True

        [ _, "Elm", _ ] ->
            True

        [ _, "Elm" ] ->
            True

        _ ->
            False
