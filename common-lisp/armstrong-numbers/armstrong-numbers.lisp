(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

(defun armstrong-number-p (number)
  (let* ( 
    (digits (number-to-digits number))
    (expo (length digits))
    (powers (mapcar (lambda (x) (expt x expo)) digits))
    (armstrong (reduce #'+ powers)))
    (= number armstrong)
  )
)


(defun number-to-digits (number) 
  (let (
    (str (write-to-string number))
    (zero-value (char-int #\0)))
    (map 'list (lambda (c) (- (char-int c) zero-value)) str)
  )
)