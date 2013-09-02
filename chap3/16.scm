#lang scheme

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define x (cons 'x1 'x2))
(define y (cons x x))

(define w3 (cons 'a (cons 'b (cons 'c null))))
(count-pairs w3)

(define w4 (cons x (cons x null)))
(count-pairs w4)

(define w7 (cons y y))
(count-pairs w7)

(define winf (cons 'a (cons 'b (cons 'c null))))
;;                              set this ^ to inflist