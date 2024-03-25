(ns accumulate)

(defn accumulate [function collection]
  (for [element collection]
    (function element)))
