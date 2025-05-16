(ns triangle)


(defn- valid?
  [a b c]
  (and (< c (+ a b)) (< b (+ a c)) (< a (+ b c))))

(defn- isosceles
  [a b c] (or (= a b) (= a c) (= b c)))

(defn- triangle?
  [a b c predicate]
  (and (valid? a b c) (predicate a b c)))

(defn equilateral?
  "Returns true if the triangle with sides a, b, and c is equilateral; otherwise, returns false"
  [a b c]
  (triangle? a b c =))

(defn isosceles?
  "Returns true if the triangle with sides a, b, and c is isosceles; otherwise, returns false"
  [a b c]
  (triangle? a b c isosceles))

(defn scalene?
  "Returns true if the triangle with sides a, b, and c is scalene; otherwise, returns false"
  [a b c]
  (triangle? a b c (complement isosceles)))
