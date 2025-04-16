(ns rna-transcription)

(defn to-rna
  "Returns the RNA complement of the given DNA string sequence."
  [dna]
  (->> dna
       (map {\G \C \C \G \T \A \A \U})
       (apply str)))
