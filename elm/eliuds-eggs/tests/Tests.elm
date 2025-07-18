module Tests exposing (tests)

import EliudsEggs exposing (eggCount)
import Expect
import Test exposing (Test, describe, test)


tests : Test
tests =
    describe "Pop Count"
        [ test "0 eggs" <|
            \() -> Expect.equal 0 (eggCount 0)
        , test "1 egg" <|
            \() -> Expect.equal 1 (eggCount 16)
        , test "4 eggs" <|
            \() -> Expect.equal 4 (eggCount 89)
        , test "13 eggs" <|
            \() -> Expect.equal 13 (eggCount 2000000000)
        ]
