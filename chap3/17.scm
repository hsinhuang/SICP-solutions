#lang scheme

(require "count.scm")

(define (count-pairs x)
  (define (count-distinct-pairs x)
    (if (or (not (pair? x)) (counted? x))
        0
        (begin (count! x)
               (+ (count-distinct-pairs (car x))
                  (count-distinct-pairs (cdr x))
                  1))))
  (begin (reset!)
         (count-distinct-pairs x)))

(define x (cons 'x1 'x2))
(define y (cons x x))

(define w3 (cons 'a (cons 'b (cons 'c null))))
(count-pairs w3)

(define w4 (cons x (cons x null)))
(count-pairs w4)

(define w7 (cons y y))
(count-pairs w7)