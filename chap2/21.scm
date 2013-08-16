#lang scheme

(require "map.scm")

(define (square-list* items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list* (cdr items)))))

(define (square-list l)
  (map (lambda (x) (* x x)) l))

;; > (square-list (list 1 2 3 4))
;; (1 4 9 16)