(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn anagrams-for [word prospect-list]
  (let [lower-word (lower-case word)
        not-word #(not= % lower-word)
        sorted-word (sort lower-word)
        anagram #(= sorted-word (sort %))
        anagram? #(let [lower (lower-case %)]
                    (and (anagram lower) (not-word lower)))]
    (filter anagram? prospect-list)))
