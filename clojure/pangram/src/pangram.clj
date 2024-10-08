(ns pangram (:require [clojure.string :as s]))

(def lower-alphabet
  (map char (range (int \a) (inc (int \z)))))

(defn pangram? [sentence]
  (every? (set (s/lower-case sentence)) lower-alphabet))
