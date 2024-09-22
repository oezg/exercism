(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn map-equal? [f & args]
  (apply = (map f args)))

(defn not-equal? [a b]
  (not (map-equal? lower-case a b)))

(defn anagram? [a b]
  (map-equal? (comp sort lower-case) a b))

(defn all-check? [fix-input & binary-predicates]
  (let [unary-predicates (map #(partial % fix-input) binary-predicates)]
    (fn [x] (every? #(% x) unary-predicates))))

(defn anagrams-for [word prospect-list]
  (let [anagram (all-check? word anagram? not-equal?)]
    (filter anagram prospect-list)))