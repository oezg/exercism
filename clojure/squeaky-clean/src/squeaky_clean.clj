(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn clean
  "TODO: add docstring"
  [s]
  (str/replace (str/replace (str/trim s) Character/CONTROL "CTRL") " " "_"))