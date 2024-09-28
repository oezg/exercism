(ns complex-numbers)

(defn real [[a _]]
  a)

(defn imaginary [[_ b]]
  b)

(defn abs [[a b]]
  (Math/sqrt (+ (* a a) (* b b))))

(defn conjugate [[a b]]
  [a (- b)])

(defn add [[a b] [c d]]
  [(+ a c)
   (+ b d)])

(defn sub [[a b] [c d]]
  [(- a c)
   (- b d)])

(defn mul [[a b] [c d]]
  [(- (* a c) (* b d))
   (+ (* b c) (* a d))])

(defn div [[a b] [c d]]
  [(/ (+ (* a c) (* b d)) (+ (* c c) (* d d)))
   (/ (- (* b c) (* a d)) (+ (* c c) (* d d)))])
