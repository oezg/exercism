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

(defun one-or-it (n) (if (= 1 n) "it" "one"))
(defun take-or-go (n) (if (zerop n) d (format nil c (one-or-it n))))
(defun ending (n) (if (= 1 n) "" "s"))
(defun stringify (n) (if (zerop n) "no more" (write-to-string (mod n 100))))
(defun line-one (n) (let ((string-n (stringify n)) (ending-n (ending n))) 
  (format nil e (format nil b (format nil a string-n ending-n)) (format nil f string-n ending-n))))
(defun line-two (n)
  (format nil e (take-or-go n) (format nil b (format nil f (stringify (- n 1)) (ending (- n 1))))))


(defun verse (n)
  "Returns a string verse for a given number."
  (format nil "~A~&~A~&" (line-one n) (line-two n)))

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (let* ((numbers (loop for i from start downto end collect i)) (verses (mapcar #'verse numbers)))
    (format nil "~{~A~%~}" verses)))
