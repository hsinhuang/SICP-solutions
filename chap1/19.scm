#lang scheme

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q)) ; compute p'
                   (+ (square q) (* 2 p q))  ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))