#lang scheme

(define (repeated f n)
  (define (iter new-f a)
    (if (< a n)
        (iter (compose f new-f) (+ a 1))
        new-f))
  (iter f 1))