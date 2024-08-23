module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> Result String NucleotideCounts
nucleotideCounts =
    String.foldl
        (\nucleotide ->
            Maybe.andThen
                (\({ a, c, g, t } as count) ->
                    case nucleotide of
                        'A' ->
                            Just { count | a = a + 1 }

                        'C' ->
                            Just { count | c = c + 1 }

                        'G' ->
                            Just { count | g = g + 1 }

                        'T' ->
                            Just { count | t = t + 1 }

                        _ ->
                            Nothing
                )
        )
        (Just (NucleotideCounts 0 0 0 0))
        >> Result.fromMaybe "Invalid nucleotide in strand"
