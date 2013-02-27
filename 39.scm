#lang scheme

(require "37.scm")

(define (square x) (* x x))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (square x))))
             (lambda (i) (- (* 2 i) 1))
             k))