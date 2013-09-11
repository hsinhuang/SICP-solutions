#lang scheme

(require "stream.scm")

(define (add-streams s1 s2)
  (stream-map (lambda (x y) (display '+) (+ x y))
              s1
              s2))

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs)
                                         fibs))))

;; to calculate the n-th fib, (n-1) times of addtion is needed