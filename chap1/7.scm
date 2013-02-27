#lang scheme

(require "eg1-1-7.scm")

(define (good-enough2? old-guess new-guess)
  (< (/ (abs (- old-guess new-guess)) old-guess) 0.00001))

(define (sqrt-iter2 guess x)
  (if (good-enough2? guess (improve guess x))
      guess
      (sqrt-iter2 (improve guess x)
                 x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))