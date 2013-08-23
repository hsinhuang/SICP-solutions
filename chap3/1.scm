#lang scheme

(require rackunit)

(define (make-accumulator sum)
  (define (acc x)
    (begin (set! sum (+ sum x))
           sum))
  acc)

(test-begin
 (let ([A (make-accumulator 5)])
   (check-equal? (A 10) 15)
   (check-equal? (A 10) 25)))