#lang scheme

;; function delete-queue! doesn't set rear pointer

(define (print-queue queue)
  (define (iter q)
    (cond [(null? q) (display ")")]
          [(null? (cdr q)) (display (car p)) (display ")")]
          [else (display (car p)) (display " ") (iter (cdr q))]))
  (display "(")
  (iter (front-ptr queue)))