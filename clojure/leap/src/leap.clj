(ns leap)

(defn leap-year?
  "Determine if a year is a leap year"
  [year]
  (and
   (zero? (rem year 4))
   (or
    (pos? (rem year 25))
    (zero? (rem year 16)))))
