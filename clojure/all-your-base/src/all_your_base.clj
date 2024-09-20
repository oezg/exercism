(ns all-your-base)

(defn valid? [from to digits]
  (and
   (>= from 2)
   (>= to 2)
   (seq digits)
   (every? #(and (>= % 0) (< % from)) digits)))

(defn to-decimal [base digits]
  (reduce #(+ %2 (* %1 base)) digits))

(defn from-decimal [n to]
  (loop [n n
         acc ()]
    (if (zero? n)
      (or (seq acc) '(0))
      (recur (quot n to) (cons (mod n to) acc)))))

(defn convert [from-base digits to-base]
  (when (valid? from-base to-base digits)
    (from-decimal (to-decimal from-base digits) to-base)))