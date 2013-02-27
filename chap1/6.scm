#lang scheme

(require "eg1-1-7.scm")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
;5

(new-if (= 1 1) 0 5)
;0

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
;it runs OK(the same as old one) on DrRacket, version 5.3.3
;but it should get stuck in infinite loop actually,
;maybe new version of DrRacket changed some semantics