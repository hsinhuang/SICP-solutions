#lang scheme

(require "1-3-1.scm")

(define (simpson-integral f a b n)
  (letrec ((h (/ (- b a) n))
           (inc (lambda (x) (+ x 1)))
           (y (lambda (k) (f (+ a (* k h)))))
           (g (lambda (i) (cond ((or (= i 0) (= i n)) (y i))
                                ((even? i) (* 2 (y i)))
                                (else (* 4 (y i)))))))
    (/ (* (sum g 0 inc n)
          h)
       3.0)))