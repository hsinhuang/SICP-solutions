#lang scheme

(require "eg1-2-6.scm")

(define (carmichael? n)
  (define (test-it a)
    (= (expmod a n n) a))
  (define (iter i)
    (cond ((>= i n) #t)
          ((test-it i) (iter (+ i 1)))
          (else #f)))
  (iter 2))

(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)