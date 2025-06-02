(ns strain)

(defn retain
  "Keeps the items in coll for which (pred item) returns true."
  [pred coll]
  (if (seq coll)
    (let [head (first coll)
          tail (rest coll)]
      (if (pred head)
        (lazy-seq (cons head (retain pred tail)))
        (recur pred tail)))
    '()))

(defn discard
  "Removes the items in coll for which (pred item) returns true."
  [pred coll]
  (retain (complement pred) coll))
