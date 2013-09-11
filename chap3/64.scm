#lang scheme

(require "stream.scm")

(define (stream-limit s tolerance)
  (cond [(stream-null? s) s]
        [(stream-null? (stream-cdr s)) s]
        [else (if (< (abs (- (stream-car s)
                             (stream-car (stream-cdr s))))
                     tolerance)
                  (cons-stream (stream-car s)
                               (stream-cdr s))
                  (stream-limit (stream-cdr s) tolerance))]))