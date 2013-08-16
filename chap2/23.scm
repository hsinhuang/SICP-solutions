#lang scheme

(define (for-each do items)
  (if (null? items)
      #t
      (begin (do (car items))
             (for-each do (cdr items)))))

;; > (for-each (lambda (x) (newline) (display x))
;; >           (list 57 321 88))
;; 57
;; 321
;; 88