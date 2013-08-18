#lang scheme

(provide make-segment
         start-segment
         end-segment)

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))