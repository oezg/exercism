module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram text =
  let textLower = map toLower text
      contains ch = elem ch textLower
   in all contains ['a' .. 'z']