#lang scheme

(require "enumerate-interval.scm")
(require "flatmap.scm")

(define (unique-tri-tuples n)
  (let ([enum (enumerate-interval 1 n)])
    (flatmap (lambda (p)
               (map (lambda (i) (cons i p))
                    (filter (lambda (x) (not (or (= (car p) x)
                                                 (= (cadr p) x))))
                            enum)))
             (flatmap (lambda (i)
                        (map (lambda (j) (list i j))
                             (filter (lambda (x) (not (= x i)))
                                     enum)))
                      enum))))

(define (sum-s-tri-tuple n s)
  (filter (lambda (tri) (= s (+ (car tri) (cadr tri) (caddr tri))))
          (unique-tri-tuples n)))