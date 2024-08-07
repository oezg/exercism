(defpackage :beer-song
  (:use :cl)
  (:export :verse :sing))

(in-package :beer-song)


(defconstant a "~@(~A~) bottle~A of beer")
(defconstant b "~A on the wall")
(defconstant c "Take ~A down and pass it around")
(defconstant d "Go to the store and buy some more")
(defconstant e "~A, ~A.~&")
(defconstant f "~A bottle~A of beer")

(defun take-or-go (n) (if (= 0 n) d (format nil c (one-it n))))
(defun one-it (n) (if (= 1 n) "it" "one"))
(defun ending (n) (if (= 1 n) "" "s"))
(defun stringify (n) (if (zerop n) "no more" (write-to-string (mod n 100))))
(defun join-lines (line1 line2) (format nil "~A~&~A~&" line1 line2))
(defun join-verses (verse1 verse2) (format nil "~A~%~A" verse1 verse2))
(defun line-one (n) (let* ((string-n (stringify n)) (ending-n (ending n)) (hada (format nil a string-n ending-n))) 
  (format nil e (format nil b hada) hada)))
(defun line-two (n) (let ((string-n-1 (stringify (- n 1))) (ending-n-1 (ending (- n 1))))
  (format nil e (take-or-go n) (format nil b (format nil f string-n-1 ending-n-1)))))


(defun verse (n)
  "Returns a string verse for a given number."
  (join-lines (line-one n) (line-two n))
  )

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  )
