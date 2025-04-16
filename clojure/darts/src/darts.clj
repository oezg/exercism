(ns darts
  (:require
   [clojure.math :as math]))

(defn score
  "Calculates the score of a dart throw"
  [x y]
  (condp < (math/hypot x y)
    10 0
    5 1
    1 5
    10))
