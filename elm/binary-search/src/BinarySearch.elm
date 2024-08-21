module BinarySearch exposing (find)

import Array exposing (Array)


find : Int -> Array Int -> Maybe Int
find target xs =
    let
        elm : Int -> Int -> Maybe Int
        elm lower upper =
            if lower >= upper then
                Nothing

            else
                let
                    m =
                        lower + (upper - lower) // 2

                    -- Having to define default value is unnecessary!
                    n =
                        Array.get m xs |> Maybe.withDefault -target
                in
                if n == target then
                    Just m

                else if n < target then
                    elm (m + 1) upper

                else
                    elm lower m
    in
    elm 0 (Array.length xs)
