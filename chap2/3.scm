#lang scheme

(require "2.scm")

(define (make-rectangle s1 s2)
  (if (> (length-segment s1) (length-segment s2))
      (cons s2 s1)
      (cons s1 s2)))

(define (height-rectangle r)
  (cdr r))

(define (width-rectangle r)
  (car r))

(define (length-segment s)
  (define (square x) (* x x))
  (sqrt (+ (square (- (x-point (start-segment s))
                      (x-point (end-segment s))))
           (square (- (y-point (start-segment s))
                      (y-point (end-segment s)))))))

(define (perimeter-rectangle r)
  (* (+ (length-segment (height-rectangle r))
        (length-segment (width-rectangle r)))
     2))

(define (area-rectangle r)
  (* (length-segment (height-rectangle r))
     (length-segment (width-rectangle r))))