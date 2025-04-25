(ns triangle)


(defn valid?
  [a b c]
  (and (< c (+ a b)) (< b (+ a c)) (< a (+ b c))))

(defn equilateral?
  "Returns true if the triangle with sides a, b, and c is equilateral; otherwise, returns false"
  [a b c]
  (and (valid? a b c) (= a b c)))

(defn isosceles?
  "Returns true if the triangle with sides a, b, and c is isosceles; otherwise, returns false"
  [a b c]
  (and (valid? a b c) (or (= a b) (= b c) (= a c))))

(defn scalene?
  "Returns true if the triangle with sides a, b, and c is scalene; otherwise, returns false"
  [a b c] 
  (and (valid? a b c) (not (equilateral? a b c)) (not (isosceles? a b c))))
