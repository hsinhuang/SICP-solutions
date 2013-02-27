#lang scheme

(require "43.scm")

(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3.0)))

(define (smooth-n f n)
  ((repeated smooth n) f))

(define (f x)
  (if (< x 0)
      (- x)
      x))

(define x 0)
(define k 10)

(f x)
((smooth f) x)
(((repeated smooth k) f) x)
((smooth-n f k) x)