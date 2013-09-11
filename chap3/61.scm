#lang scheme

(require "stream.scm")

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
               (add-streams (scale-stream (stream-cdr s2)
                                          (stream-car s1))
                            (mul-series (stream-cdr s1)
                                        s2))))

(define (inverse-series stream)
  (define X (cons-stream 1
                         (stream-map - (mul-series X
                                                   (stream-cdr stream)))))
  X)