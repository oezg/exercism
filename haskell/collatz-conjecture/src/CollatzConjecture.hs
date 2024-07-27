module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz number = if number > 0 then Just (collatz' 0 number) else Nothing
  where
    collatz' acc 1 = acc
    collatz' acc n = collatz' (acc + 1) (next n)
    next n = if even n then div n 2 else 3 * n + 1
