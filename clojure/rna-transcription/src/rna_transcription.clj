(ns rna-transcription)

(defn to-rna
  "Returns the RNA complement of the given DNA string sequence."
  [dna]
  (let [rna (map {\G \C \C \G \T \A \A \U} dna)]
    (when-not (some nil? rna) (apply str rna))))