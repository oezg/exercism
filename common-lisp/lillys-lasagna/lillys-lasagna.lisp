(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

;; Define function expected-time-in-oven
(defun expected-time-in-oven () "Number of minutes the lasagna should be in the oven" 337)

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (minutes) 
  "takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven"
  (- (expected-time-in-oven) minutes))

;; Define function preparation-time-in-minutes
(defun preparation-time-in-minutes (layers) "Each layer takes 19 minutes to prepare." (* 19 layers))

;; Define function elapsed-time-in-minutes
(defun elapsed-time-in-minutes (layers minutes) "Compute sum of prepration time and time lasagna has already been in the oven." (+ (preparation-time-in-minutes layers) minutes))