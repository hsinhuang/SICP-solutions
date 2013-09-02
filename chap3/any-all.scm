#lang scheme

(provide any?
         all?)

(define (any? pred items)
  (if (null? items)
      #f
      (or (pred (car items))
          (any? pred (cdr items)))))

(define (all? pred items)
  (if (null? items)
      #t
      (and (pred (car items))
           (all? pred (cdr items)))))