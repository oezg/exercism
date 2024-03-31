(ns accumulate)

(defn accumulate [function collection]
  (if (empty? collection)
    []
    (cons
     (function (first collection))
     (accumulate function (rest collection)))))
