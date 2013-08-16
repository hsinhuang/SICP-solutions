#lang scheme

(provide (all-defined-out))

(define (tree-map func tree)
  (cond [(null? tree) null]
        [(not (pair? tree)) (func tree)]
        [else (cons (tree-map func (car tree))
                    (tree-map func (cdr tree)))]))

(define (square-tree tree) (tree-map (lambda (x) (* x x))
                                     tree))

;; > (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))