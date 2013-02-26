#lang scheme

(define (double x)
  (+ x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (halve x)
  (if (even? x)
      (/ x 2)
      (error "cannot halve an odd number" x)))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))