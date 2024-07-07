module Pangram (isPangram) where

import Data.Char
import qualified Data.Set as Set

isPangram :: String -> Bool
isPangram text = (Set.fromList . filter isAsciiLower . map toLower) text == Set.fromList ['a' .. 'z']