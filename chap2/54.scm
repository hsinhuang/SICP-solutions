#lang scheme

(provide equal?)

(define (equal? a b)
  (cond [(and (number? a) (number? b)) (= a b)]
        [(and (symbol? a) (symbol? b)) (eq? a b)]
        [(and (list? a) (list? b))
         (cond [(and (null? a) (null? b)) #t]
               [(or (null? a) (null? b)) #f]
               [else (and (equal? (car a) (car b))
                          (equal? (cdr a) (cdr b)))])]
        [else #f]))