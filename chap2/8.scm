#lang scheme

(require "7.scm")

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (upper-bound y))
                 (- (upper-bound x)
                    (lower-bound y))))

;(print-interval (sub-interval x y))