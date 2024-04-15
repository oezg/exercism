module Darts (score) where

score :: Float -> Float -> Int
score x y
  | radius <= innerCircle = 10
  | radius <= middleCircle = 5
  | radius <= outerCircle = 1
  | otherwise = 0
  where
    radius = sqrt (x * x + y * y)
    (innerCircle, middleCircle, outerCircle) = (1, 5, 10)
