(ns etl
  (:require [clojure.string :as string]))

(defn transform [source]
  (->> (for [[score values] source
             value values]
         [(string/lower-case value) score])
       (into {})))
