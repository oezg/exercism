#lang racket

(provide leap-year?)

(define (divisible n m)
  (= 0 (modulo n m)))

(define (leap-year? year)
  (and (divisible year 4) (or (not (divisible year 100)) (divisible year 400))))
