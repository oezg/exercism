(ns all-your-base
  (:require [clojure.math :as math]))

(defn from-base-to-ten [p acc b l]
  (cond
    (< 2 b) nil
    (empty? l) (reverse acc)
    :else (let [[item1 & remaining] l]
            (if (or (neg? item1) (>= item1 b)) nil
                (from-base-to-ten (dec p) (cons (* item1 (math/pow b p)) acc) b remaining)))))

;; (defn from-base-to-ten [b l]
;;   (let [n (dec (count l))]
;;     (reduce + (map-indexed #(* %2 (math/pow b (- n %1))) l))))

(defn convert [from-base digits to-base]
  (->> digits
       (from-base-to-ten (dec (count digits)) '() from-base)
       (from-ten-to-base to-base)
       (to-digits)))
