#lang scheme

(provide (all-defined-out))

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

;; > (left-branch (make-mobile 1 2))
;; 1
;; > (right-branch (make-mobile 1 2))
;; 2
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))