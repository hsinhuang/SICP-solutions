#lang scheme

(require "eg1-2-6.scm")

(define runtime current-inexact-milliseconds)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; >1000    : 1009    => 0.31
;          : 1013
;          : 1019
; >10000   : 10007   => 0.41
;          : 10009
;          : 10037
; >100000  : 100003  => 1.00
;          : 100019
;          : 100043
; >1000000 : 1000003 => 1.43
;          : 1000033
;          : 1000037