#lang scheme

(provide counted?
         count!
         reset!)

(require "any-all.scm")

(define counted null)
(define (counted? x)
  (any? (lambda (e) (eq? x e)) counted))
(define (count! x)
  (set! counted (cons x counted)))
(define (reset!)
  (set! counted null))