(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)

(defconstant GS 1000000000)
(defconstant UTC 0)

(defun from (year month day hour minute second)
  (multiple-value-bind (second-gs minute-gs hour-gs day-gs month-gs year-gs) 
      (decode-universal-time (+ GS (encode-universal-time second minute hour day month year UTC)) UTC) 
      (list year-gs month-gs day-gs hour-gs minute-gs second-gs)))
