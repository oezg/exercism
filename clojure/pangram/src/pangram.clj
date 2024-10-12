(ns pangram (:require [clojure.string :as s]
                      [clojure.set :as set]))

(def ^:private lower-alphabet
  (set (map char (range (int \a) (inc (int \z))))))

(defn pangram? [sentence]
  (set/subset? lower-alphabet (set (s/lower-case sentence))))
