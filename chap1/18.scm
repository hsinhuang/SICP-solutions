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
  (define (iter s a b)
    (cond ((= b 0) s)
          ((even? b) (iter s (double a) (halve b)))
          (else (iter (+ s a) a (- b 1)))))
  (iter 0 a b))