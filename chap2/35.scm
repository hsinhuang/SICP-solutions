#lang scheme

(require "accumulate.scm")
(require "map.scm")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (t) (if (not (pair? t)) 1
                                       (+ (if (not (pair? (car t)))
                                              1
                                              (count-leaves (car t)))
                                          (count-leaves (cdr t)))))
                       t)))

;; > (define x (cons (list 1 2) (list 3 4)))
;; > (count-leaves x)
;; 4
;; > (count-leaves (list x x))
;; 8