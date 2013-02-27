#lang scheme

(require "7.scm" "8.scm")

(define (width-interval x)
  (/ (- (upper-bound x)
        (lower-bound x))
     2))