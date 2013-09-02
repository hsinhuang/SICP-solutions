#lang scheme

(require "mlist.scm")

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (mcdr x)))
          (set-mcdr! x y)
          (loop temp x))))
  (mlist->immutable (loop (list->mutable x) '())))

;; `mystery` reverses the given list
;; > v
;; '(a b c d)
;; > w
;; '(d c b a)