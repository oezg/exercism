(ns armstrong-numbers)

(defn- digitize
  [num]
  (->> num
       (iterate #(quot % 10))
       (take-while pos?)
       (map #(rem % 10))))

(defn- to-nth-pow [n]
  (fn [x] (apply * (repeat n x))))

(defn- powers [num]
  (let [digits (digitize num)
        to-pow (to-nth-pow (count digits))]
    (map to-pow digits)))

(defn- armstrong [num]
  (apply + (powers num)))

(defn armstrong? [num]
  (== num (armstrong num)))
