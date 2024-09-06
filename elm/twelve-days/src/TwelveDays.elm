module TwelveDays exposing (recite)

import Dict


recite : Int -> Int -> List String
recite start stop =
    List.range start stop |> List.map verse


verse : Int -> String
verse n =
    let
        nth =
            Dict.get n numbers |> Maybe.withDefault ""

        prefix =
            "On the " ++ nth ++ " day of Christmas my true love gave to me: "

        elm acc x =
            if x == 0 then
                List.reverse acc

            else
                elm (Maybe.withDefault "" (Dict.get x verses) :: acc) (x - 1)

        body =
            if n == 1 then
                "a Partridge in a Pear Tree"

            else
                String.join ", " (elm [] n)
    in
    prefix ++ body ++ "."


numbers : Dict.Dict number String
numbers =
    Dict.fromList
        [ ( 1, "first" )
        , ( 2, "second" )
        , ( 3, "third" )
        , ( 4, "fourth" )
        , ( 5, "fifth" )
        , ( 6, "sixth" )
        , ( 7, "seventh" )
        , ( 8, "eighth" )
        , ( 9, "ninth" )
        , ( 10, "tenth" )
        , ( 11, "eleventh" )
        , ( 12, "twelfth" )
        ]


verses : Dict.Dict number String
verses =
    Dict.fromList
        [ ( 1, "and a Partridge in a Pear Tree" )
        , ( 2, "two Turtle Doves" )
        , ( 3, "three French Hens" )
        , ( 4, "four Calling Birds" )
        , ( 5, "five Gold Rings" )
        , ( 6, "six Geese-a-Laying" )
        , ( 7, "seven Swans-a-Swimming" )
        , ( 8, "eight Maids-a-Milking" )
        , ( 9, "nine Ladies Dancing" )
        , ( 10, "ten Lords-a-Leaping" )
        , ( 11, "eleven Pipers Piping" )
        , ( 12, "twelve Drummers Drumming" )
        ]
