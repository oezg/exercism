(ns collatz-conjecture)



(defn collatz [num]
  (when (< num 1) (throw (Exception. "Input must be positive")))
  (loop [n num
         acc 0]
    (cond (= 1 n) acc
          (even? n) (recur (/ n 2) (inc acc))
          :else (recur (inc (* 3 n)) (inc acc)))))
