#lang scheme

(require "stream.scm")

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (append (list (stream-car s)) x))
                (stream-cdr (pairs t u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(define (phythagorean-numbers)
  (define (square x) (* x x))
  (stream-filter
   (lambda (x)
     (let ([i (car x)]
           [j (cadr x)]
           [k (caddr x)])
       (and (<= i j) (= (+ (square i) (square j))
                        (square k)))))
   (triples integers integers integers)))