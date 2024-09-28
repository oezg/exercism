(ns etl
  (:require [clojure.string :refer [lower-case]]))

(defn transform [source]
  (into {} (for [[k v] source s v] [(lower-case s) k])))
