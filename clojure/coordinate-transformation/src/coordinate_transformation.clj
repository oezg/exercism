(ns coordinate-transformation)

(defn translate2d
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x y] [(+ x dx) (+ y dy)]))

(defn scale2d
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x y] [(* x sx) (* y sy)]))

; why do I need apply?
; https://exercism.org/tracks/clojure/exercises/coordinate-transformation/solutions/ErikSchierboom
(defn compose-transform
  "Create a composition function that returns a function that
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [a b] (apply g (f a b))))

; what is let? what is do?
; https://exercism.org/tracks/clojure/exercises/coordinate-transformation/solutions/Nto
(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [arguments (atom nil)
        results (atom nil)]
    (fn [x y]
      (if (= @arguments [x y])
        @results
        (do
          (reset! arguments [x y])
          (reset! results (f x y)))))))
