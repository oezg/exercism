module Tests exposing (tests)

import Expect
import Luhn exposing (valid)
import Test exposing (Test, describe, test)


tests : Test
tests =
    describe "Luhn"
        [ test "single digit strings can not be valid" <|
            \_ ->
                Expect.equal False (valid "1")
        , test "a single zero is invalid" <|
            \_ ->
                Expect.equal False (valid "0")
        , test "a simple valid SIN that remains valid if reversed" <|
            \_ ->
                Expect.equal True (valid "059")
        , test "a simple valid SIN that becomes invalid if reversed" <|
            \_ ->
                Expect.equal True (valid "59")
        , test "a valid Canadian SIN" <|
            \_ ->
                Expect.equal True (valid "055 444 285")
        , test "invalid Canadian SIN" <|
            \_ ->
                Expect.equal False (valid "055 444 286")
        , test "invalid credit card" <|
            \_ ->
                Expect.equal False (valid "8273 1232 7352 0569")
        , test "invalid long number with a remainder divisible by 5" <|
            \_ ->
                Expect.equal False (valid "1 2345 6789 1234 5678 9013")
        , test "valid strings with a non-digit included become invalid" <|
            \_ ->
                Expect.equal False (valid "055a 444 285")
        , test "valid strings with punctuation included become invalid" <|
            \_ ->
                Expect.equal False (valid "055-444-285")
        , test "valid strings with symbols included become invalid" <|
            \_ ->
                Expect.equal False (valid "055£ 444$ 285")
        , test "single zero with space is invalid" <|
            \_ ->
                Expect.equal False (valid " 0")
        , test "more than a single zero is valid" <|
            \_ ->
                Expect.equal True (valid "0000 0")
        , test "input digit 9 is correctly converted to output digit 9" <|
            \_ ->
                Expect.equal True (valid "091")
        , test "very long input is valid" <|
            \_ ->
                Expect.equal True (valid "9999999999 9999999999 9999999999 9999999999")
        , test "valid luhn with an odd number of digits and non zero first digit" <|
            \_ ->
                Expect.equal True (valid "109")
        , test "numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed" <|
            \_ ->
                Expect.equal False (valid "59%59")
        ]
