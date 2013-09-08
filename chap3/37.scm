#lang scheme

(require "connector.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier x (/ 1 y) z)
    z))

(define (cv x)
  (let ((y (make-connector)))
    (constant x y)
    y))