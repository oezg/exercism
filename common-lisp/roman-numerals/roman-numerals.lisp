(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

(defun romanize (n) 
  "Returns the Roman numeral representation for a given number."
  (format nil "~@R" n))
