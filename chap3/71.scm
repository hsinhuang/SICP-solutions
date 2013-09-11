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

(define (foo x)
  (define (tri x) (* x x))
  (+ (tri (car x)) (tri (cadr x))))

(define (ramanujan s)
  (define (stream-cadr s) (stream-car (stream-cdr s)))
  (define (stream-cddr s) (stream-cdr (stream-cdr s)))
  (let ((scar (stream-car s))
        (scadr (stream-cadr s)))
    (if (= (foo scar) (foo scadr)) 
        (cons-stream (list (foo scar) scar scadr)
                     (ramanujan (stream-cddr s)))
        (ramanujan (stream-cdr s)))))

(define ramanujan-numbers
  (ramanujan (weighted-pairs foo integers integers)))