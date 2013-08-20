#lang scheme

(require "huffman.scm"
         "67.scm")

(define (in-list? items x)
  (if (null? items)
      #f
      (or (equal? (car items) x)
          (in-list? (cdr items) x))))

(define (encode-symbol sym tree)
  (define (encode-symbol-1 current-tree)
    (if (leaf? current-tree)
        null
    (let ([left (left-branch current-tree)]
          [right (right-branch current-tree)])
      (cond [(in-list? (symbols left) sym)
             (cons 0 (encode-symbol-1 left))]
            [(in-list? (symbols right) sym)
             (cons 1 (encode-symbol-1 right))]))))
  (if (in-list? (symbols tree) sym)
      (encode-symbol-1 tree)
      (error "bad symbol -- ENCODE-SYMBOL" sym)))

(define (encode message tree)
  (if (null? message)
      null
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
  
;; > (encode (decode sample-message sample-tree) sample-tree)
;; (0 1 1 0 0 1 0 1 0 1 1 1 0)