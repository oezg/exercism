(ns all-your-base)

(defn to-decimal [base digits]
  (reduce (fn [acc cur] (+ cur (* acc base))) digits))

(defn valid? [from to digits]
  (and
   (>= from 2)
   (>= to 2)
   (seq digits)
   (every? nat-int? digits)
   (every? (fn [digit] (< digit from)) digits)))

(defn to-to [n to]
  (loop [n n
         acc ()]
    (if (zero? n)
      (if (seq acc) acc '(0))
      (recur (quot n to) (cons (mod n to) acc)))))

(defn convert [from-base digits to-base]
  (when (valid? from-base to-base digits)
    (to-to (to-decimal from-base digits) to-base)))