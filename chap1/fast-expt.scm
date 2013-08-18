#lang scheme

(provide fast-expt)

(define (fast-expt b n)
  (define (iter e b n)
    (cond ((= n 0) e)
          ((even? n) (iter e (square b) (/ n 2)))
          (else (iter (* e b) b (- n 1)))))
  (iter 1 b n))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))