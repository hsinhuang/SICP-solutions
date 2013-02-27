#lang scheme

(require "eg1-2-6.scm")

(define runtime current-inexact-milliseconds)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from to)
  (if (> from to)
      (newline)
      (begin (timed-prime-test from)
             (search-for-primes (+ from 1) to))))

; >1000    : 1009    => 0.008
;          : 1013
;          : 1019
; >10000   : 10007   => 0.019
;          : 10009
;          : 10037
; >100000  : 100003  => 0.054
;          : 100019
;          : 100043
; >1000000 : 1000003 => 0.158
;          : 1000033
;          : 1000037