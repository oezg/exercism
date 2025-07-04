module Tests exposing (tests)

import CustomSet
import Expect
import Test exposing (Test, describe, test)


tests : Test
tests =
    describe "CustomSet"
        [ describe "Unique elements can be added to a set"
            [ test "add to empty set" <|
                \() ->
                    CustomSet.insert 3 CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 3 ]
            , test "add to non-empty set" <|
                \() ->
                    CustomSet.insert 3 (CustomSet.fromList [ 1, 2, 4 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 1, 2, 3, 4 ]
            , test "adding an existing element does not change the set" <|
                \() ->
                    CustomSet.insert 3 (CustomSet.fromList [ 1, 2, 3 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 1, 2, 3 ]
            ]
        , describe "Returns true if the set contains no elements"
            [ test "empty set is empty" <|
                \() ->
                    CustomSet.isEmpty CustomSet.empty
                        |> Expect.equal True
                        |> Expect.onFail "isEmpty empty should be True"
            , test "sets with no elements are empty" <|
                \() ->
                    CustomSet.isEmpty (CustomSet.fromList [])
                        |> Expect.equal True
                        |> Expect.onFail "isEmpty (fromList []) should be True"
            , test "sets with elements are not empty" <|
                \() ->
                    CustomSet.isEmpty (CustomSet.fromList [ 1 ])
                        |> Expect.equal False
                        |> Expect.onFail "isEmpty (fromList [ 1 ]) should be False"
            ]
        , describe "Sets can report if they contain an element"
            [ test "nothing is contained in an empty set" <|
                \() ->
                    CustomSet.member 1 CustomSet.empty
                        |> Expect.equal False
                        |> Expect.onFail "member 1 empty should be False"
            , test "when the element is in the set" <|
                \() ->
                    CustomSet.member 1 (CustomSet.fromList [ 1, 2, 3 ])
                        |> Expect.equal True
                        |> Expect.onFail "member 1 (fromList [ 1, 2, 3 ]) should be True"
            , test "when the element is not in the set" <|
                \() ->
                    CustomSet.member 4 (CustomSet.fromList [ 1, 2, 3 ])
                        |> Expect.equal False
                        |> Expect.onFail "member 4 (fromList [ 1, 2, 3 ]) should be False"
            ]
        , describe "Sets with the same elements are equal"
            [ test "empty sets are equal" <|
                \() ->
                    CustomSet.equal CustomSet.empty CustomSet.empty
                        |> Expect.equal True
                        |> Expect.onFail "equal empty empty should be True"
            , test "empty set is not equal to non-empty set" <|
                \() ->
                    CustomSet.equal CustomSet.empty (CustomSet.fromList [ 1, 2, 3 ])
                        |> Expect.equal False
                        |> Expect.onFail "equal empty (fromList [ 1, 2, 3 ]) should be False"
            , test "non-empty set is not equal to empty set" <|
                \() ->
                    CustomSet.equal (CustomSet.fromList [ 1, 2, 3 ]) CustomSet.empty
                        |> Expect.equal False
                        |> Expect.onFail "equal (fromList [ 1, 2, 3 ]) empty should be False"
            , test "sets with the same elements are equal" <|
                \() ->
                    CustomSet.equal (CustomSet.fromList [ 1, 2 ]) (CustomSet.fromList [ 2, 1 ])
                        |> Expect.equal True
                        |> Expect.onFail "equal (fromList [ 1, 2 ]) (fromList [ 2, 1 ]) should be True"
            , test "set is equal to a set constructed from an array with duplicates" <|
                \() ->
                    CustomSet.equal (CustomSet.fromList [ 1 ]) (CustomSet.fromList [ 1, 1 ])
                        |> Expect.equal True
                        |> Expect.onFail "equal (fromList [ 1 ]) (fromList [ 1, 1 ]) should be True"
            , test "sets with different elements are not equal" <|
                \() ->
                    CustomSet.equal (CustomSet.fromList [ 1, 2, 3 ]) (CustomSet.fromList [ 1, 2, 4 ])
                        |> Expect.equal False
                        |> Expect.onFail "equal (fromList [ 1, 2, 3 ]) (fromList [ 1, 2, 4 ]) should be False"
            , test "set is not equal to larger set with same elements" <|
                \() ->
                    CustomSet.equal (CustomSet.fromList [ 1, 2, 3 ]) (CustomSet.fromList [ 1, 2, 3, 4 ])
                        |> Expect.equal False
                        |> Expect.onFail "equal (fromList [ 1, 2, 3 ]) (fromList [ 1, 2, 3, 4 ]) should be False"
            ]
        , describe "Union returns a set of all elements in either set"
            [ test "union of empty sets is an empty set" <|
                \() ->
                    CustomSet.union CustomSet.empty CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "union of an empty set and non-empty set is the non-empty set" <|
                \() ->
                    CustomSet.union CustomSet.empty (CustomSet.fromList [ 2 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 2 ]
            , test "union of a non-empty set and empty set is the non-empty set" <|
                \() ->
                    CustomSet.union (CustomSet.fromList [ 1, 3 ]) CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 1, 3 ]
            , test "union of non-empty sets contains all unique elements" <|
                \() ->
                    CustomSet.union (CustomSet.fromList [ 1, 3 ]) (CustomSet.fromList [ 2, 3 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 1, 2, 3 ]
            ]
        , describe "Intersection returns a set of all shared elements"
            [ test "intersection of two empty sets is an empty set" <|
                \() ->
                    CustomSet.intersect CustomSet.empty CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "intersection of an empty set and non-empty set is an empty set" <|
                \() ->
                    CustomSet.intersect CustomSet.empty (CustomSet.fromList [ 3, 2, 5 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "intersection of a non-empty set and an empty set is an empty set" <|
                \() ->
                    CustomSet.intersect (CustomSet.fromList [ 1, 2, 3, 4 ]) CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "intersection of two sets with no shared elements is an empty set" <|
                \() ->
                    CustomSet.intersect (CustomSet.fromList [ 1, 2, 3 ]) (CustomSet.fromList [ 4, 5, 6 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "intersection of two sets with shared elements is a set of the shared elements" <|
                \() ->
                    CustomSet.intersect (CustomSet.fromList [ 1, 2, 3, 4 ]) (CustomSet.fromList [ 3, 2, 5 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 2, 3 ]
            ]
        , describe "Difference (or Complement) of a set is a set of all elements that are only in the first set"
            [ test "difference of two empty sets is an empty set" <|
                \() ->
                    CustomSet.diff CustomSet.empty CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "difference of empty set and non-empty set is an empty set" <|
                \() ->
                    CustomSet.diff CustomSet.empty (CustomSet.fromList [ 3, 2, 5 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists []
            , test "difference of a non-empty set and an empty set is the non-empty set" <|
                \() ->
                    CustomSet.diff (CustomSet.fromList [ 1, 2, 3, 4 ]) CustomSet.empty
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 1, 2, 3, 4 ]
            , test "difference of two non-empty sets is a set of elements that are only in the first set" <|
                \() ->
                    CustomSet.diff (CustomSet.fromList [ 3, 2, 1 ]) (CustomSet.fromList [ 2, 4 ])
                        |> CustomSet.toList
                        |> List.sort
                        |> Expect.equalLists [ 1, 3 ]
            , test "difference removes all duplicates in the first set" <|
                \() ->
                    CustomSet.diff (CustomSet.fromList [ 1, 1 ]) (CustomSet.fromList [ 1 ])
                        |> CustomSet.toList
                        |> Expect.equalLists []
            ]
        , describe "A set is a subset if all of its elements are contained in the other set"
            [ test "empty set is a subset of another empty set" <|
                \() ->
                    CustomSet.subset CustomSet.empty CustomSet.empty
                        |> Expect.equal True
                        |> Expect.onFail "subset empty empty should be True"
            , test "empty set is a subset of non-empty set" <|
                \() ->
                    CustomSet.subset CustomSet.empty (CustomSet.fromList [ 1 ])
                        |> Expect.equal True
                        |> Expect.onFail "subset empty (fromList [ 1 ]) should be True"
            , test "non-empty set is not a subset of empty set" <|
                \() ->
                    CustomSet.subset (CustomSet.fromList [ 1 ]) CustomSet.empty
                        |> Expect.equal False
                        |> Expect.onFail "subset (fromList [ 1 ]) empty should be False"
            , test "set is a subset of set with exact same elements" <|
                \() ->
                    CustomSet.subset (CustomSet.fromList [ 1, 2, 3 ]) (CustomSet.fromList [ 1, 2, 3 ])
                        |> Expect.equal True
                        |> Expect.onFail "subset (fromList [ 1, 2, 3 ]) (fromList [ 1, 2, 3 ]) should be True"
            , test "set is a subset of larger set with same elements" <|
                \() ->
                    CustomSet.subset (CustomSet.fromList [ 1, 2, 3 ]) (CustomSet.fromList [ 4, 1, 2, 3 ])
                        |> Expect.equal True
                        |> Expect.onFail "subset (fromList [ 1, 2, 3 ]) (fromList [ 4, 1, 2, 3 ]) should be True"
            , test "set is not a subset of set that does not contain its elements" <|
                \() ->
                    CustomSet.subset (CustomSet.fromList [ 1, 2, 3 ]) (CustomSet.fromList [ 4, 1, 3 ])
                        |> Expect.equal False
                        |> Expect.onFail "subset (fromList [ 1, 2, 3 ]) (fromList [ 4, 1, 3 ]) should be False"
            ]
        , describe "Sets are disjoint if they share no elements"
            [ test "the empty set is disjoint with itself" <|
                \() ->
                    CustomSet.disjoint CustomSet.empty CustomSet.empty
                        |> Expect.equal True
                        |> Expect.onFail "disjoint empty empty should be True"
            , test "empty set is disjoint with non-empty set" <|
                \() ->
                    CustomSet.disjoint CustomSet.empty (CustomSet.fromList [ 1 ])
                        |> Expect.equal True
                        |> Expect.onFail "disjoint empty (fromList [ 1 ]) should be True"
            , test "non-empty set is disjoint with empty set" <|
                \() ->
                    CustomSet.disjoint (CustomSet.fromList [ 1 ]) CustomSet.empty
                        |> Expect.equal True
                        |> Expect.onFail "disjoint (fromList [ 1 ]) empty should be True"
            , test "sets are not disjoint if they share an element" <|
                \() ->
                    CustomSet.disjoint (CustomSet.fromList [ 1, 2 ]) (CustomSet.fromList [ 2, 3 ])
                        |> Expect.equal False
                        |> Expect.onFail "disjoint (fromList [ 1, 2 ]) (fromList [ 2, 3 ]) should be False"
            , test "sets are disjoint if they share no elements" <|
                \() ->
                    CustomSet.disjoint (CustomSet.fromList [ 1, 2 ]) (CustomSet.fromList [ 3, 4 ])
                        |> Expect.equal True
                        |> Expect.onFail "disjoint (fromList [ 1, 2 ]) (fromList [ 3, 4 ]) should be True"
            ]
        ]
