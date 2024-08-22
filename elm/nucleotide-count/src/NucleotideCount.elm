module NucleotideCount exposing (nucleotideCounts)

import Task exposing (sequence)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> Result String NucleotideCounts
nucleotideCounts sequence =
    Result.fromMaybe "Invalid nucleotide in strand" (elm sequence (NucleotideCounts 0 0 0 0))


elm sequence acc =
    case String.uncons sequence of
        Nothing ->
            Just acc

        Just ( c, rest ) ->
            (case c of
                'A' ->
                    Just { acc | a = acc.a + 1 }

                'C' ->
                    Just { acc | c = acc.c + 1 }

                'G' ->
                    Just { acc | g = acc.g + 1 }

                'T' ->
                    Just { acc | t = acc.t + 1 }

                _ ->
                    Nothing
            )
                |> Maybe.andThen (elm rest)
