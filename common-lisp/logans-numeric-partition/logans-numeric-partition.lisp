(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (pair-list num)
  (if (oddp num)
      (cons (cons num (car pair-list)) (cdr pair-list))
      (cons (car pair-list) (cons num (cdr pair-list)))))

(defun partition-numbers (nums)
  (reduce #'categorize-number nums :initial-value (cons nil nil)))
