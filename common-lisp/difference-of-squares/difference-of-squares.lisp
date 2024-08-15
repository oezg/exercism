(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun square-of-sum (n)
  "Calculates the square of the sum for a given number."

  (loop with result = 0
      for i from 1 to n
      do (setf result (+ result i))
      finally (return (* result result)))
  )

(defun sum-of-squares (n)
  "Calculates the sum of squares for a given number."
  (loop with result = 0
    for i from 1 to n
    do (setf result (+ result (* i i)))
    finally (return result))
  )

(defun difference (n)
  "Finds the diff. between the square of the sum and the sum of the squares."
  (abs (- (sum-of-squares n) (square-of-sum n)))
  )
