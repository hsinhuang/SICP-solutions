#lang scheme

(require "37.scm")

(cont-frac (lambda (i) 1.0)
           (lambda (i) (if (= (remainder i 3) 2)
                           (* (ceiling (/ i 3))
                              2)
                           1))
           100)
; e-2