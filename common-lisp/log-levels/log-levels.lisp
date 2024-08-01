(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string) 
  (subseq log-string 8))

(defun log-severity (log-string)
  (let ((level (subseq log-string 1 5))) 
    (cond ((string-equal "info" level) :everything-ok)
          ((string-equal "warn" level) :getting-worried)
          ((string-equal "ohno" level) :run-for-cover))))

(defun log-format (log-string)
  (let ((message (log-message log-string)))
    (case (log-severity log-string)
      (:everything-ok (string-downcase message))
      (:getting-worried (string-capitalize message))
      (:run-for-cover (string-upcase message)))))
