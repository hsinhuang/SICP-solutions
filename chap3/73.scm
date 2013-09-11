#lang scheme

(require "stream.scm")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC R C dt)
  (lambda (i v0) (add-stream (scale-stream i R)
                             (integral (scale-stream i (/ 1 C))
                                       v0
                                       dt))))