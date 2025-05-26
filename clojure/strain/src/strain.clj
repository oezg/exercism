(ns strain)

(defn retain
  "Keeps the items in coll for which (pred item) returns true."
  [pred [head & tail :as coll]]
  (if (empty? coll)
    '()
    (lazy-seq
     (if (pred head)
       (cons head (retain pred tail))
       (retain pred tail)))))

(defn discard
  "Removes the items in coll for which (pred item) returns true."
  [pred coll]
  (retain (complement pred) coll))
