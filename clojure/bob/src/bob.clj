(ns bob (:require [clojure.string :as s]))

(defn response-for [said]
  (let [any-upper (some #(Character/isUpperCase %) said)
        any-lower (some #(Character/isLowerCase %) said)
        yell (and any-upper (not any-lower))
        question (s/ends-with? (s/trimr said) "?")
        silence (s/blank? said)]
    (cond
      (and yell question) "Calm down, I know what I'm doing!"
      yell "Whoa, chill out!"
      question "Sure."
      silence "Fine. Be that way!"
      :else "Whatever.")))
