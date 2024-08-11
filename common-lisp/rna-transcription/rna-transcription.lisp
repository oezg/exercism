(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defparameter nucleaotides (make-hash-table :test 'eql))
(setf (gethash #\G nucleaotides) #\C)
(setf (gethash #\C nucleaotides) #\G)
(setf (gethash #\T nucleaotides) #\A)
(setf (gethash #\A nucleaotides) #\U)


(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string (lambda (nuc) (gethash nuc nucleaotides)) str))