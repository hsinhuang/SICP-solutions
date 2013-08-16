#lang scheme

(define (deep-reverse l)
  (define (r-iter rest result)
    (cond [(null? rest) result]
          [(not (pair? rest)) rest]
          [else (r-iter (cdr rest)
                        (cons (r-iter (car rest) null)
                              result))]))
  (r-iter l null))

(define x (list (list 1 2) (list 3 4)))

x
;; ((1 2) (3 4))

(reverse x)
;; ((3 4) (1 2))

(deep-reverse x)
;; ((4 3) (2 1))