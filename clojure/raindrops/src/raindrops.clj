(ns raindrops
  (:require [clojure.string :as string]))

(def ^:private sounds
  (sorted-map 3 "Pling" 5 "Plang" 7 "Plong"))

(defn- rains? [s]
  (if (empty? s) false s))

(defn- drops [n]
  (for [[m sound] sounds :when (zero? (rem n m))] sound))

(defn convert [n]
  (or (rains? (string/join (drops n))) (str n)))
