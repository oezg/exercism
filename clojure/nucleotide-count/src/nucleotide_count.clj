(ns nucleotide-count)

(defn count-of-nucleotide-in-strand
  "Given a nucleotide and a string representing a DNA sequence, count how many of the given nucleotide is present.
   If the string contains characters that aren't A, C, G, or T then it is invalid and it throws an assertion error."
  [nucleotide strand]
  (assert ((set "ACGT") nucleotide))
  (count (filter #(= % nucleotide) strand)))


(defn nucleotide-counts
  "Given a string representing a DNA sequence, count how many of each nucleotide is present.
   If the string contains characters that aren't A, C, G, or T then it is invalid and it throws an assertion error."
  [strand]
  (into {} (for [nucleotide "ACGT"]
             [nucleotide (count-of-nucleotide-in-strand nucleotide strand)])))
