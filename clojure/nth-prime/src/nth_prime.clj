(ns nth-prime)

(defn- prime? [n]
  (every? xyz (range)))

(defn- next-prime [n]
  (loop [n (inc n)]
    (if (prime? n)
      n
      (recur n))))

(defn nth-prime
  "Returns the prime number in the nth position."
  [n]
  (first (drop (dec n) (iterate next-prime 2))))
