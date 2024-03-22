(ns armstrong-numbers)

(defn digitize
  [num]
  (map #(mod % 10) (take-while pos? (iterate #(quot % 10) num))))

(defn powers [num]
  (let [digits (digitize num)]
    (map #(Math/pow % (count digits)) digits)))

(defn armstrong [num]
  (apply + (powers num)))

(defn armstrong? [num]
  (== num (armstrong num)))
