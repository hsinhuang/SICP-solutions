#lang scheme

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;regular order -> infinite loop
;application order -> 0