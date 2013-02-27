#lang scheme

(require "../chap1/16.scm")

(define (cons a b)
  (* (fast-expt 2 a)
     (fast-expt 3 b)))

(define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))

(car (cons 16 27))
(cdr (cons 23 89))