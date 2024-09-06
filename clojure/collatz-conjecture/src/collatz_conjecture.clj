(ns collatz-conjecture)

(defn collatz [num]
  (assert (pos? num) "Input must be positive")
  (loop [n num
         acc 0]
    (let [step (if (even? n) (/ n 2) (inc (* n 3)))]
      (if (= n 1) acc (recur step (inc acc))))))
