#lang scheme

(define (fringe l)
  (define (iter rest ans)
    (cond [(null? rest) ans]
          [(not (pair? rest)) (list rest)]
          [else (iter (cdr rest)
                      (append ans (iter (car rest) null)))]))
  (iter l null))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
;; (1 2 3 4)

(fringe (list x x))
;; (1 2 3 4 1 2 3 4)