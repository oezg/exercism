(ns nucleotide-count)

(def ^:private nucleotide? (set "ACGT"))
(def ^:private blank (zipmap nucleotide? (repeat 0)))

(defn count-of-nucleotide-in-strand
  "Given a nucleotide and a string representing a DNA sequence, count how many of the given nucleotide is present.
   If the string contains characters that aren't A, C, G, or T then it is invalid and it throws an assertion error."
  [nucleotide strand]
  (assert (nucleotide? nucleotide))
  (count (filter (partial = nucleotide) strand)))


(defn nucleotide-counts
  "Given a string representing a DNA sequence, count how many of each nucleotide is present.
   If the string contains characters that aren't A, C, G, or T then it is invalid and it throws an assertion error."
  [strand]
  (->> (frequencies strand)
       (merge blank)))
