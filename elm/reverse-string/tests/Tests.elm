module Tests exposing (tests)

import Expect
import ReverseString exposing (reverse)
import Test exposing (..)


tests : Test
tests =
    describe "ReverseString"
        [ test "an empty string" <|
            \() -> Expect.equal "" (reverse "")
        , test "a word" <|
                \() -> Expect.equal "tobor" (reverse "robot")
        , test "a capitalized word" <|
                \() -> Expect.equal "nemaR" (reverse "Ramen")
        , test "a sentence with punctuation" <|
                \() -> Expect.equal "!yrgnuh m'I" (reverse "I'm hungry!")
        , test "a palindrme" <|
                \() -> Expect.equal "racecar" (reverse "racecar")
        , test "an even-sized word" <|
                \() -> Expect.equal "reward" (reverse "drawer")
        , test "wide characters" <|
                \() -> Expect.equal "猫子" (reverse "子猫")
        , test "grapheme cluster with pre-combined form" <|
                \() -> Expect.equal "dnatsnehctsrüW" (reverse "Würstchenstand")
        ]
