#lang scheme

(provide cons
         car
         cdr
         set-car!
         set-cdr!
         show
         display-setable)

(define (cons x y)
  (define (set-x! v) (set! x v))
  (define (set-y! v) (set! y v))
  (define (dispatch m)
    (cond ((eq? m 'car) x)
          ((eq? m 'cdr) y)
          ((eq? m 'set-car!) set-x!)
          ((eq? m 'set-cdr!) set-y!)
          (else (error "Undefined operation -- CONS" m))))
  dispatch)

(define (car z) (z 'car))
(define (cdr z) (z 'cdr))

(define (set-car! z new-value)
  ((z 'set-car!) new-value)
  z)

(define (set-cdr! z new-value)
  ((z 'set-cdr!) new-value)
  z)

(define (show z)
  (display-setable z))

(define (display-setable z)
  (define (iter z)
    (if (null? z)
        (display "")
        (begin (display (car z))
               (if (null? (cdr z)) (display "") (display " "))
               (iter (cdr z)))))
  (begin (display "(")
         (iter z)
         (display ")")))