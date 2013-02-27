#lang scheme

(require "1-3-3.scm" "43.scm")

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2.0)))

(define (sqrt x)
  (fixed-point ((repeated average-damp 1) (lambda (y) (/ x y)))
               1.0))

(define (cbrt x)
  (fixed-point ((repeated average-damp 1) (lambda (y) (/ x (square y))))
               1.0))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (qurt x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (cube y))))
               1.0))

;;for nth roots, floor(log n/log 2) average damps are required