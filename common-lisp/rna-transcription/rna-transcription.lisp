(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string (lambda (nuc) (ecase nuc (#\G #\C)
                                        (#\C #\G)
                                        (#\T #\A)
                                        (#\A #\U))) str))