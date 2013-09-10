#lang scheme

(require "stream.scm")

;; a)
(define (integrate-series series)
  (define (inner s n)
    (cons-stream (/ (car s) n)
                 (inner (stream-cdr s) (+ n 1))))
  (inner series 1))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

;; b)
(define cosine-series
  (cons-stream 1 (stream-map - (integrate-series sine-series))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))