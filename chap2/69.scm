#lang scheme

(require "huffman.scm")

(define (successive-merge set)
  (if (= (length set) 1)
      (car set)
      (successive-merge (adjoin-set (make-code-tree (car set)
                                                    (cadr set))
                                    (cddr set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))