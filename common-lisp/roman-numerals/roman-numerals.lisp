(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

(defparameter *roman* (make-array '(4 10) :initial-contents '(
  ("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX") 
  ("" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC") 
  ("" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM") 
  ("" "M" "MM" "MMM" "" "" "" "" "" "")
)))

(defun romanize (number)
  "Returns the Roman numeral representation for a given number."
  (flet ((roman-digit (from-right) 
      (let ((digit (mod (floor number (expt 10 from-right)) 10))) 
        (aref *roman* from-right digit))))
    (format nil "~{~A~}" (mapcar #'roman-digit '(3 2 1 0)))))
