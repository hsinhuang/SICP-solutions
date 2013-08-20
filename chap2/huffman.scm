#lang scheme

(provide decode
         encode
         adjoin-set
         make-leaf
         leaf?
         make-leaf-set
         make-code-tree
         generate-huffman-tree
         left-branch
         right-branch
         symbols
         weight)

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (choose-branch bit branch)
  (cond [(= bit 0) (left-branch branch)]
        [(= bit 1) (right-branch branch)]
        [else (error "bad bit -- CHOOSE-BRANCH" bit)]))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        null
        (let ([next-branch (choose-branch (car bits) current-branch)])
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (adjoin-set x set)
  (cond [(null? set) (list x)]
        [(< (weight x) (weight (car set))) (cons x set)]
        [else (cons (car set)
                    (adjoin-set x (cdr set)))]))

;; > (make-leaf-set '((A 4) (B 2) (C 1) (D 1)))
;; ((leaf D 1) (leaf C 1) (leaf B 2) (leaf A 4))
(define (make-leaf-set pairs)
  (if (null? pairs)
      null
      (let ([pair (car pairs)])
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

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

(define (successive-merge set)
  (if (= (length set) 1)
      (car set)
      (successive-merge (adjoin-set (make-code-tree (car set)
                                                    (cadr set))
                                    (cddr set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))