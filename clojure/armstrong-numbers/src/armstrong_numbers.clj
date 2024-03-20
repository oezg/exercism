(ns armstrong-numbers)

(defn digitize 
  [num]
  (loop [x num acc []]
    (if (= x 0) acc
    (recur (quot x 10) (conj acc (mod x 10))))))

(defn powers [num]
  (let [digits (digitize num)]
   (map #(Math/pow % (count digits)) digits)))

(defn armstrong [num]
  (apply + (powers num)))

(defn armstrong? [num]
  (== num (armstrong num)))
