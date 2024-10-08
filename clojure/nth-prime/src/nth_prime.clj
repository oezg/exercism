(ns nth-prime)

(defn candidates [n]
  (range 3 (inc (Math/sqrt n)) 2))

(defn divisible-by [n m]
  (zero? (rem n m)))

(defn prime? [n]
  (every? (partial (complement divisible-by) n) (candidates n)))

(defn next-prime
  "Returns the next prime number greater than n."
  [n]
  (cond
    (= 1 n) 2
    (= 2 n) 3
    :else (let [n (+ 2 n)]
            (if (prime? n) n (recur n)))))

(defn nth-prime
  "Returns the prime number in the nth position."
  [n]
  (when-not (pos-int? n)
    (throw (IllegalArgumentException. "The position must be bigger than zero.")))
  (first (drop n (iterate next-prime 1))))
