#lang scheme

(require "eg1-2-6.scm")

(define (filtered-accumulate combiner null-value term a filter? next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter? a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; a)
(define (sum-prime a b)
  (filtered-accumulate + 0 identity a prime? inc b))

;; b)
(define (prime-n-product n)
  (define (prime-n? i)
    (= (gcd n i) 1))
  (filtered-accumulate * 1 identity 2 prime? inc (- n 1)))