#lang scheme

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
;(A 1 10) => 2^10 => 1024

;(A 2 4) => (A 1 (A 2 3)) => 2^(A 2 3)
;(A 2 3) => 2^(A 2 2), (A 2 2) => 2^(A 2 1), (A 2 1) => 2
;so (A 2 4) => 2^(2^(2^2)) => 2^(2^4) => 2^16 => 65536

;(A 3 3) => (A 2 (A 3 2))
;(A 3 2) => (A 2 (A 3 1)), (A 3 1) => 2, (A 3 2) => (A 2 2)
;according to last problem, (A 2 2) => 2^(A 2 1) => 2^2 => 4
;so (A 3 3) => (A 2 4) => 65536

(define (f n) (A 0 n))
;2n

(define (g n) (A 1 n))
;2^n

(define (h n) (A 2 n))
;2^(2^(...^2)...), which contains n 2's.

(define (k n) (* 5 n n))