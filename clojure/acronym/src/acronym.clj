(ns acronym
  (:require [clojure.string :as str]))

(defn insert-space-before-uppercase [s]
  (str/replace s #"(?<=[a-z])(?=[A-Z])" " "))

(defn split-space-and-hyphen [s]
  (str/split s #"[ -]"))

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (->> phrase
       (insert-space-before-uppercase)
       (split-space-and-hyphen)
       (map first)
       (map str)
       (map str/upper-case)
       (str/join)))
