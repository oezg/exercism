(ns resistor-color-duo
  (:require [resistor-color :refer [color-code]]))

(defn resistor-value
  "Returns the resistor value based on the given colors"
  [colors]
  (->> colors
       (take 2)
       (map color-code)
       (reduce #(+ %2 (* 10 %1)))))
