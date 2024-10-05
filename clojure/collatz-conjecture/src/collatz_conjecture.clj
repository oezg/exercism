(ns collatz-conjecture)

(defn step [n]
  (if (even? n)
    (/ n 2)
    (inc (* n 3))))

(defn collatz [num]
  (assert (pos? num) "Input must be positive")
  (loop [n num
         acc 0]
    (if (= n 1)
      acc
      (recur (step n) (inc acc)))))
