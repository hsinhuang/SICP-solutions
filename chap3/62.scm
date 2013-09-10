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

(define (div-series s1 s2)
  (mul-series s1 (inverse-series s2)))

(define (integrate-series series)
  (define (inner s n)
    (cons-stream (/ (car s) n)
                 (inner (stream-cdr s) (+ n 1))))
  (inner series 1))

(define cosine-series
  (cons-stream 1 (stream-map - (integrate-series sine-series))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

(define tangent-series
  (div-series sine-series cosine-series))