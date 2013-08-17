#lang scheme

(define fold-left foldl)
(define fold-right foldr)

(fold-right / 1 (list 1 2 3))
;; 3/2
(fold-left / 1 (list 1 2 3))
;; 3/2
(fold-right list null (list 1 2 3))
;; (1 (2 (3 ())))
(fold-left list null (list 1 2 3))
;; (3 (2 (1 ())))