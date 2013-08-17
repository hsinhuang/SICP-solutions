#lang scheme

(require "accumulate.scm")
(require "accumulate-n.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ([cols (transpose n)])
    (map (lambda (row) (matrix-*-vector cols row)) m)))

;; > (define v1 (list 1 2 3 4))
;; > (define v2 (list 4 3 2 1))
;; > (define m1 (list v1 v2))
;; > (define m2 (list v1 (list 3 5 1 7)))
;; > (dot-product v1 v2)
;; 20
;; > (matrix-*-vector m1 v1)
;; (30 20)
;; > (transpose m1)
;; ((1 4) (2 3) (3 2) (4 1))
;; > (matrix-*-matrix m1 (transpose m1))
;; ((30 20) (20 30))
;; > (matrix-*-matrix m1 (transpose m2))
;; ((30 44) (20 36))