module Tests exposing (tests)

import Anagram exposing (detect)
import Expect
import Test exposing (..)


tests : Test
tests =
    describe "Anagram"
        [ test "no matches" <|
            \() ->
                Expect.equal []
                    (detect "diaper" [ "hello", "world", "zombies", "pants" ])
        , test "detects simple anagram" <|
                \() ->
                    Expect.equal [ "tan" ]
                        (detect "ant" [ "tan", "stand", "at" ])
        , test "does not detect false positives" <|
                \() ->
                    Expect.equal []
                        (detect "galea" [ "eagle" ])
        , test "detects multiple anagrams" <|
                \() ->
                    Expect.equal [ "lemons", "melons" ]
                        (detect "solemn" [ "lemons", "cherry", "melons" ])
        , test "does not detect anagram subsets" <|
                \() ->
                    Expect.equal []
                        (detect "good" [ "dog", "goody" ])
        , test "detects anagram" <|
                \() ->
                    Expect.equal [ "inlets" ]
                        (detect "listen" [ "enlists", "google", "inlets", "banana" ])
        , test "detects even more anagrams" <|
                \() ->
                    Expect.equal [ "gallery", "regally", "largely" ]
                        (detect "allergy" [ "gallery", "ballerina", "regally", "clergy", "largely", "leading" ])
        , test "does not detect identical words" <|
                \() ->
                    Expect.equal [ "cron" ]
                        (detect "corn" [ "corn", "dark", "Corn", "rank", "CORN", "cron", "park" ])
        , test "does not detect non-anagrams with identical checksum" <|
                \() ->
                    Expect.equal []
                        (detect "mass" [ "last" ])
        , test "detects anagrams case-insensitively" <|
                \() ->
                    Expect.equal [ "Carthorse" ]
                        (detect "Orchestra" [ "cashregister", "Carthorse", "radishes" ])
        , test "detects anagrams using case-insensitive subject" <|
                \() ->
                    Expect.equal [ "carthorse" ]
                        (detect "Orchestra" [ "cashregister", "carthorse", "radishes" ])
        , test "detects anagrams using case-insensitive possible matches" <|
                \() ->
                    Expect.equal [ "Carthorse" ]
                        (detect "orchestra" [ "cashregister", "Carthorse", "radishes" ])
        , test "does not detect a word as its own anagram" <|
                \() ->
                    Expect.equal []
                        (detect "BANANA" [ "BANANA" ])
        , test "does not detect a word as its own anagram with small casing difference" <|
                \() ->
                    Expect.equal []
                        (detect "banana" [ "Banana" ])
        , test "does not detect a word as its own anagram with large casing difference" <|
                \() ->
                    Expect.equal []
                        (detect "banana" [ "BANANA" ])
        , test "words other than themselves can be anagrams" <|
                \() ->
                    Expect.equal [ "Silent" ]
                        (detect "LISTEN" [ "LISTEN", "Silent" ])
        , test "does not detect a anagram if the original word is repeated" <|
                \() ->
                    Expect.equal []
                        (detect "go" [ "goGoGO" ])
        , test "anagrams must use all letters exactly once (go)" <|
                \() ->
                    Expect.equal []
                        (detect "tapper" [ "patter" ])
        , test "eliminates anagrams with the same checksum" <|
                \() ->
                    Expect.equal []
                        (detect "mass" [ "last" ])
        , test "handles case of greek letters" <|
                \() ->
                    Expect.equal [ "ΒΓΑ", "γβα" ]
                        (detect "ΑΒΓ" [ "ΒΓΑ", "ΒΓΔ", "γβα", "αβγ" ])
        , test "eliminates misleading unicode anagrams" <|
                \() ->
                    Expect.equal []
                        (detect "ΑΒΓ" [ "ABΓ" ])
        , test "anagrams must use all letters exactly once" <|
                \() ->
                    Expect.equal []
                        (detect "patter" [ "tapper" ])
        , test "different characters may have the same bytes" <|
                \() ->
                    Expect.equal []
                        (detect "a⬂" [ "€a" ])
        ]
