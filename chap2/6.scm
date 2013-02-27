#lang scheme

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (+ a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))

(define (value a)
  (define f sqrt)
  (define x 256)
  ((a f) x))

(value zero);256
(value one);16
(value two);4
(value (add-1 two));2
(value (+ zero one));16
(value (+ one zero));16
(value (+ zero two));4
(value (+ two zero));4
(value (+ one one));4
(value (+ two one));2
(value (+ one two));2
(value (+ two two));1.414