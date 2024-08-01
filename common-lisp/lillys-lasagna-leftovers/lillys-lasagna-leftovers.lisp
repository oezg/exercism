(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defun preparation-time (&rest layers)
  (* 19 (length layers)))

(defun remaining-minutes-in-oven (&optional (dur :normal))
  (case dur
    (:normal 337)
    (:shorter 237)
    (:very-short 137)
    (:longer 437)
    (:very-long 537)
    ((nil) 0)
    (otherwise 1000)))

(defun split-leftovers (&key (weight 0 weight-provided-p) (human 10) (alien 10))
  (cond ((and weight-provided-p (eq nil weight)) :looks-like-someone-was-hungry)
        (weight-provided-p (- weight (+ human alien)))
        (t :just-split-it)))
