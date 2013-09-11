#lang scheme

(require "stream.scm")

;; the following is copied from
;; http://community.schemewiki.org/?SICP-Solutions

(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (let ((integrand (force delayed-integrand)))
                   (add-streams (scale-stream integrand dt)
                                int))))
  int)

(define (RLC R L C dt)
  (define (rcl vc0 il0)
    (define vc (integral (delay dvc) vc0  dt))
    (define il (integral (delay dil) il0 dt))
    (define dvc (scale-stream il (- (/ 1 C))))
    (define dil (add-streams (scale-stream vc (/ 1 L))
                             (scale-stream il (- (/ R L)))))
    (define (merge-stream s1 s2)
      (cons-stream (cons (stream-car s1) (stream-car s2))
                   (merge-stream (stream-cdr s1) (stream-cdr s2))))
    (merge-stream vc il))
  rcl)