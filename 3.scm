#lang scheme

(provide (all-defined-out))

(define (sum-of-bigger-two a b c)
  (cond ((and (<= a b) (<= a c)) (+ b c))
        ((and (<= b a) (<= b c)) (+ a c))
        ((and (<= c a) (<= c b)) (+ a b))))