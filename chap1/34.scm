#lang scheme

(define (f g)
  (g 2))

(define (square x) (* x x))

(f square)

(f f)
;;unbounded identifier: 2