(ns all-your-base)


(defn convert [from-base digits to-base]
  (cond
    (< from-base 2) nil
    (< to-base 2) nil
    (empty? digits) ()
    (some neg? digits) nil
    (some #(>= % from-base) digits) nil
    (every? zero? digits) '(0)
    :else (let [n (reduce #(+ %2 (* %1 from-base)) digits)]
            (loop [n n
                   acc ()]
              (if (zero? n)
                acc
                (recur (quot n to-base) (conj acc (mod n to-base))))))))