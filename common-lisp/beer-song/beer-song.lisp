(defpackage :beer-song
  (:use :cl)
  (:export :verse :sing))

(in-package :beer-song)

(defun verse (n)
  "Returns a string verse for a given number."
  (let ((line1 (format nil "~[No more~:;~a~] bottle~:p of beer on the wall, ~[no more~:;~a~] bottle~:p of beer." n n n n))
        (case0 "Go to the store and buy some more, 99 bottles of beer on the wall.")
        (line2 (format nil "Take ~[~;it~:;one~] down and pass it around, ~[no more~:;~a~] bottle~:p of beer on the wall." n (1- n) (1- n))))
    (format nil "~a~&~a~&" line1 (if (zerop n) case0 line2))))

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (format nil "~{~a~%~}" (mapcar #'verse (loop for i from start downto end collect i))))
