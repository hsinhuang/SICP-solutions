#lang scheme

(require "16.scm")

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
;no
;because multiplication costs time which is related to the multipliers