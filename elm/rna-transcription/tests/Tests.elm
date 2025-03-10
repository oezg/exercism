module Tests exposing (tests)

import Expect
import RnaTranscription exposing (toRNA)
import Test exposing (..)


tests : Test
tests =
    describe "RNATranscription"
        [ test "complement of cytosine is guanine" <|
            \() -> Expect.equal (Ok "G") (toRNA "C")
        , test "complement of guanine is cytosine" <|
                \() -> Expect.equal (Ok "C") (toRNA "G")
        , test "complement of thymine is adenine" <|
                \() -> Expect.equal (Ok "A") (toRNA "T")
        , test "complement of adenine is uracil" <|
                \() -> Expect.equal (Ok "U") (toRNA "A")
        , test "complement" <|
                \() -> Expect.equal (Ok "UGCACCAGAAUU") (toRNA "ACGTGGTCTTAA")
        , test "input \"INVALID\" should produce an error" <|
                \() ->
                    toRNA "INVALID"
                        |> Expect.err
                        |> Expect.onFail "expected an error message output. For example `Err \"Invalid input\"`"
        ]
