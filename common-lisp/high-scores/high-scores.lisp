(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

(defun make-high-scores-table () (make-hash-table))

(defun add-player (scores player) (setf (gethash player scores) 0))

(defun set-score (scores player score) (setf (gethash player scores) score))

(defun get-score (scores player) (gethash player scores 0))

(defun remove-player (scores player) (remhash player scores))
