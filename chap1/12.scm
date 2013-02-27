#lang scheme

(define (pascal-triangle n i)
  (if (or (= i 1) (= i n))
      1
      (+ (pascal-triangle (- n 1) (- i 1))
         (pascal-triangle (- n 1) i))))