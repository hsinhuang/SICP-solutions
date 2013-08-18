#lang scheme

(define (split put-whole put-smallers)
  (define (way-to-split painter n)
    (if (= n 0)
        painter
        (let ([smaller (way-to-split painter (- n 1))])
          (put-whole painter (put-smallers smaller smaller)))))
  (lambda (painter n)
    (way-to-split painter n)))