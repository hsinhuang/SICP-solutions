#lang scheme

(provide mlist
         list->mutable
         mlist->immutable)

(define (list->mutable l)
  (if (null? l)
      l
      (mcons (car l) (list->mutable (cdr l)))))

(define (mlist->immutable l)
  (if (null? l)
      l
      (cons (mcar l) (mlist->immutable (mcdr l)))))

(define (mlist . l)
  (list->mutable l))