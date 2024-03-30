module GottaSnatchEmAll exposing (..)

import Set exposing (Set)


type alias Card =
    String


newCollection : Card -> Set Card
newCollection =
    Set.singleton


addCard : Card -> Set Card -> ( Bool, Set Card )
addCard card collection =
    ( Set.member card collection
    , newCollection card
        |> Set.union collection
    )


tradeCard : Card -> Card -> Set Card -> ( Bool, Set Card )
tradeCard yourCard theirCard collection =
    let
        worth =
            Set.member yourCard collection
                && not (Set.member theirCard collection)

        update =
            collection
                |> Set.remove yourCard
                |> Set.insert theirCard
    in
    ( worth, update )


removeDuplicates : List Card -> List Card
removeDuplicates =
    Set.fromList >> Set.toList


extraCards : Set Card -> Set Card -> Int
extraCards yourCollection theirCollection =
    Set.diff yourCollection theirCollection
        |> Set.size


boringCards : List (Set Card) -> List Card
boringCards collections =
    case collections of
        [] ->
            []

        first :: rest ->
            List.foldl Set.intersect first rest
                |> Set.toList


totalCards : List (Set Card) -> Int
totalCards collections =
    List.foldl Set.union Set.empty collections
        |> Set.size


splitShinyCards : Set Card -> ( List Card, List Card )
splitShinyCards collection =
    Set.partition (String.startsWith "Shiny") collection
        |> Tuple.mapBoth Set.toList Set.toList
