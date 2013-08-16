#lang scheme

(require "29-a.scm")

(provide (all-defined-out))

(define (branch-has-structure? branch)
  (not (number? (branch-structure branch))))

(define (total-weight mobile)
  (if (number? mobile) mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))

(define branch1 (make-branch 2 6)) ;; length - 2; weight - 6
(define branch2 (make-branch 3 4)) ;; length - 3; weight - 4
(define branch3 (make-branch 4 3)) ;; length - 4; weight - 3
(define mobile1 (make-mobile branch1 branch2)) ;; weight - 10
(define mobile2 (make-mobile branch3 branch1)) ;; weight - 8
(define branch4 (make-branch 1.2 mobile1)) ;; length - 2; weight - 10
(define mobile3 (make-mobile branch2 branch4))

;; > (total-weight mobile3)
;; 14