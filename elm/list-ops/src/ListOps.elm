module ListOps exposing
    ( append
    , concat
    , filter
    , foldl
    , foldr
    , length
    , map
    , reverse
    )


length : List a -> Int
length list =
    case list of
        [] ->
            0

        _ :: tail ->
            1 + length tail


reverse : List a -> List a
reverse list =
    case list of
        [] ->
            []

        x :: xs ->
            reverse xs ++ [ x ]


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of
        [] ->
            acc

        x :: xs ->
            foldl f (f x acc) xs


foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    case list of
        [] ->
            acc

        x :: xs ->
            f x (foldr f acc xs)


map : (a -> b) -> List a -> List b
map f list =
    case list of
        [] ->
            []

        x :: xs ->
            f x :: map f xs


filter : (a -> Bool) -> List a -> List a
filter f list =
    case list of
        [] ->
            []

        x :: xs ->
            if f x then
                x :: filter f xs

            else
                filter f xs


append : List a -> List a -> List a
append xs ys =
    foldr (::) ys xs


concat : List (List a) -> List a
concat list =
    foldr append [] list
