#lang scheme

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

;;recursive version
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;;iterative version
(define (product-i term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) x) 1 inc n))

(define (pi-product n)
  (/ (product (lambda (x) (let ((i (* 2 x))) (* i (+ i 2))))
              1
              inc
              n)
     (product (lambda (x) (square (+ (* 2 x) 1)))
              1
              inc
              n)))

(define (pi-product-i n)
  (/ (product-i (lambda (x) (let ((i (* 2 x))) (* i (+ i 2))))
                1
                inc
                n)
     (product-i (lambda (x) (square (+ (* 2 x) 1)))
                1
                inc
                n)))

(* 4.0 (pi-product-i 10000))