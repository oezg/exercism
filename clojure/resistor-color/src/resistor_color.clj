(ns resistor-color)

(def colors
  ["black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white"])

(defn color-code
  "Returns the numerical value associated with the given color"
  [color]
  (->> colors
       (keep-indexed #(when (= color %2) %1))
       first))
