#lang scheme

(provide (all-defined-out))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

;; > (left-branch (make-mobile 1 2))
;; 1
;; > (right-branch (make-mobile 1 2))
;; 2
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))