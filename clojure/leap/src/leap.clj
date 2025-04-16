(ns leap)

(defn leap-year?
  "Determine if a year is a leap year"
  [year]
  (let [[by-4 by-100 by-400] (map #(int? (/ year 4 %)) [1 25 100])]
    (and by-4 (or (not by-100) by-400))))
