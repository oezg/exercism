(ns pangram (:require [clojure.string :as s]
                      [clojure.set :as set]
                      [criterium.core :as crit]))

(def lower-alphabet
  (map char (range (int \a) (inc (int \z)))))

(def lower-alphabet-set
  (set lower-alphabet))

(defn pangram2 [sentence]
  (every? (set (s/lower-case sentence)) lower-alphabet))

(defn pangram? [sentence]
  (set/subset? lower-alphabet-set (set (s/lower-case sentence))))

(crit/bench (pangram2 "qwertas"))