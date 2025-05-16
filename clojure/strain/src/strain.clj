(ns strain)

(defn retain
  "Keeps the items in coll for which (pred item) returns true."
  [pred coll]
  (letfn [(retain' [[head & tail] acc]
            (if (nil? head)
              acc
              (retain' tail (if (pred head) (conj acc head) acc))))]
    (retain' coll [])))

(defn discard
  "Removes the items in coll for which (pred item) returns true."
  [pred coll]
  (retain (complement pred) coll))
