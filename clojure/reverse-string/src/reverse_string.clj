(ns reverse-string
  (:require [clojure.string :as str]))

(defn reverse-string
  "reverse a given string."
  [s]
  (str/reverse s))
