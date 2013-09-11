#lang scheme

(require "stream.scm")

(define (merge-weighted weight s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< (weight s1car) (weight s2car))
                  (cons-stream s1car
                               (merge-weighted weight (stream-cdr s1) s2)))
                 ((> (weight s1car) (weight s2car))
                  (cons-stream s2car
                               (merge-weighted weight s1 (stream-cdr s2))))
                 (else
                  (cons-stream s1car
                               (merge-weighted weight
                                               (stream-cdr s1)
                                               (stream-cdr s2)))))))))

(define (weighted-pairs weight s t)
  (cons-stream 
   (list (stream-car s) (stream-car t))
   (merge-weighted
    weight
    (merge-weighted
     weight
     (stream-map (lambda (x) (list (stream-car s) x))
                 (stream-cdr t))
     (weighted-pairs weight (stream-cdr s) (stream-cdr t)))
    (stream-map (lambda (x) (list x (stream-car t)))
                (stream-cdr s)))))

(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(define i+j (weighted-pairs (lambda (x) (+ (car x) (cadr x)))
                            integers
                            integers))

(define 2i+3j+5ij (stream-filter
                   (let ([foo (lambda (x) (or (= (remainder x 2) 0)
                                              (= (remainder x 3) 0)
                                              (= (remainder x 5) 0)))])
                     (lambda (x) (or (foo (car x)) (foo (cadr x)))))
                   (weighted-pairs (lambda (x) (+ (* 2 (car x))
                                                  (* 3 (cadr x))
                                                  (* 5 (car x)
                                                     (cadr x))))
                                   integers
                                   integers)))