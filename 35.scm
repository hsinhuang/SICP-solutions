#lang scheme

(require "1-3-3.scm")

(fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1.0)