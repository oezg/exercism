module RnaTranscription exposing (toRNA)

import Dict


toRNA : String -> Result String String
toRNA =
    String.foldr
        (prepend >> Result.andThen)
        (Ok "")
        >> Result.mapError (oneNucleotide " is not a nucleotide")


prepend : Char -> String -> Result Char String
prepend char string =
    [ ( 'A', 'U' ), ( 'C', 'G' ), ( 'G', 'C' ), ( 'T', 'A' ) ]
        |> Dict.fromList
        |> Dict.get char
        |> Result.fromMaybe char
        |> Result.map (oneNucleotide string)


oneNucleotide : String -> Char -> String
oneNucleotide s c =
    String.cons c s
