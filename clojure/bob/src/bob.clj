(ns bob (:require [clojure.string :as s]))

(defn response-for [s]
  (let [any-upper (some #(Character/isUpperCase %) s)
        any-lower (some #(Character/isLowerCase %) s)
        yell (and any-upper (not any-lower))
        question (s/ends-with? (s/trimr s) "?")
        silence (s/blank? s)]
    (cond
      (and yell question) "Calm down, I know what I'm doing!"
      yell "Whoa, chill out!"
      question "Sure."
      silence "Fine. Be that way!"
      :else "Whatever.")))
