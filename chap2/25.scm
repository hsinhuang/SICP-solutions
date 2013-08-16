#lang scheme

(define x (list 1 3 (list 5 7) 9))
x
(cadr (caddr x))

(define y (list (list 7)))
y
(caar y)

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
z
(cadr (cadr (cadr (cadr (cadr (cadr z))))))