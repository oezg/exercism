module CustomSet exposing (diff, disjoint, empty, equal, fromList, insert, intersect, isEmpty, member, subset, toList, union)

import Dict exposing (Dict)


type alias Set =
    Dict Int ()


empty : Set
empty =
    Dict.empty


insert : Int -> Set -> Set
insert element =
    Dict.insert element ()


toList : Set -> List Int
toList =
    Dict.keys


fromList : List Int -> Set
fromList =
    List.map (\element -> ( element, () )) >> Dict.fromList


isEmpty : Set -> Bool
isEmpty =
    Dict.isEmpty


member : Int -> Set -> Bool
member =
    Dict.member


equal : Set -> Set -> Bool
equal =
    (==)


union : Set -> Set -> Set
union =
    Dict.union


intersect : Set -> Set -> Set
intersect =
    Dict.intersect


diff : Set -> Set -> Set
diff =
    Dict.diff


subset : Set -> Set -> Bool
subset set1 set2 =
    isEmpty (Dict.diff set1 set2)


disjoint : Set -> Set -> Bool
disjoint set1 set2 =
    isEmpty (intersect set1 set2)
