(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defparameter *nucleotides* 
  (let ((nucleotides (make-hash-table :test 'eql)))
    (setf (gethash #\G nucleotides) #\C)
    (setf (gethash #\C nucleotides) #\G)
    (setf (gethash #\T nucleotides) #\A)
    (setf (gethash #\A nucleotides) #\U)
    nucleotides))


(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string (lambda (nuc) (gethash nuc *nucleotides*)) str))