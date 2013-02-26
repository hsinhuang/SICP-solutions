#lang scheme

(require "eg1-1-7.scm")

(define (improve-cube guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough2? old-guess new-guess)
  (< (/ (abs (- old-guess new-guess)) old-guess) 0.00001))

(define (cube-iter guess x)
  (if (good-enough2? guess (improve-cube guess x))
      guess
      (cube-iter (improve-cube guess x) x)))

(define (cube x)
  (* x x x))

(define (cubic-root x)
  (cube-iter 1.0 x))