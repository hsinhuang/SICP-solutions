#lang scheme

(provide (all-defined-out))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (print-interval x)
  (newline)
  (display "(")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display ")"))

(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))

(define (lower-bound x) (car x))

(define x (make-interval 3.9 4.1))
(define y (make-interval 0.9 1.1))

;(print-interval (add-interval x y))
;(print-interval (mul-interval x y))
;(print-interval (div-interval x y))