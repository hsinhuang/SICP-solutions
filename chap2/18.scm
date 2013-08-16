#lang scheme

(define (reverse l)
  (define (r-iter rest result)
    (if (null? rest) result
        (r-iter (cdr rest) (cons (car rest) result))))
  (r-iter l null))

;; > (reverse (list 1 4 9 16 25))
;; (25 16 9 4 1)