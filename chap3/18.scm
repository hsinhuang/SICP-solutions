#lang scheme

(require "count.scm"
         "setable.scm")

(define (any-loop? x)
  (define (check x)
    (if (null? x)
        #f
        (if (counted? x)
            #t
            (begin (count! x)
                   (check (cdr x))))))
  (begin (reset!)
         (check x)))

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (cons 'a (cons 'b (cons 'c null)))))