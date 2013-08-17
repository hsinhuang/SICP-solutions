#lang scheme

(define fold-left foldl)
(define fold-right foldr)

(define (reverse* sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse** sequence)
  (fold-left (lambda (x y) (cons x y)) null sequence))