(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

(defun leap-year-p (year)
  (flet ((factorp (n) (zerop (mod year n))))
    (and (factorp 4) (or (not (factorp 100)) (factorp 400)))))
  