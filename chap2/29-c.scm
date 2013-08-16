#lang scheme

(require "29-a.scm")
(require "29-b.scm")

(define (branch-weight branch)
    (total-weight (branch-structure branch)))

(define (mobile-balance? mobile)
  (if (number? mobile) #t
      (let ([left-b (left-branch mobile)]
            [right-b (right-branch mobile)])
        (and (= (* (branch-weight left-b)
                   (branch-length left-b))
                (* (branch-weight right-b)
                   (branch-length right-b)))
             (mobile-balance? (branch-structure left-b))
             (mobile-balance? (branch-structure right-b))))))