#lang scheme

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (square x) (* x x))

(define (sqrt x)
  ((iterative-improve (lambda (guess)
                       (< (abs (- (square guess) x)) 0.001))
                     (lambda (guess)
                       (/ (+ guess (/ x guess)) 2.0)))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
                        (< (abs (- guess (f guess))) 0.00001))
                      (lambda (guess)
                        (f guess)))
   first-guess))