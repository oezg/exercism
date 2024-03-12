(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn replacer
  [c]
  (cond (= c \space) \_
        (Character/isISOControl c)
        )
  )

(defn clean
  "TODO: add docstring"
  [s]
  (
   str/replace
  )

  (apply str (map replacer (str/replace s Character/CONTROL "CTRL"))))
