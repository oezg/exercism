(ns acronym
  (:require [clojure.string :as str]))

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (str/join (map str/upper-case (map str (map first (str/split phrase #"[ -]"))))))
