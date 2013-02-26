#lang scheme

(define (smallest-divisor n)
  (define (next x)
    (if (= x 2)
        3
        (+ x 2)))
  (define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
  (find-divisor n 2))

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

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; >1000    : 1009    => 0.006
;          : 1013
;          : 1019
; >10000   : 10007   => 0.013
;          : 10009
;          : 10037
; >100000  : 100003  => 0.034
;          : 100019
;          : 100043
; >1000000 : 1000003 => 0.100
;          : 1000033
;          : 1000037

;;;OMG, I have no idea about the reason