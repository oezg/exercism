(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (cond ((< n 1) nil)
        ((= n 1) 0)
        ((evenp n) (+ 1 (collatz (/ n 2))))
        (t (+ 1 (collatz (+ 1 (* 3 n)))))))
