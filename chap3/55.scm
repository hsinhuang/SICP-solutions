#lang scheme

(require "stream.scm")

(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(define (partial-sums stream)
  (define p (cons-stream 0 (add-streams stream p)))
  (stream-cdr p))