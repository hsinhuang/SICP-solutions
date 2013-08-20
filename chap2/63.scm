#lang scheme

(provide tree->list-2)

(require "binarytree.scm")

(define (tree->list-1 tree)
  (if (null? tree)
      null
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree null))

;; a)
;; the same

(define tree1 (make-tree 7
                         (make-tree 3
                                    (make-tree 1
                                               empty-tree
                                               empty-tree)
                                    (make-tree 5
                                               empty-tree
                                               empty-tree))
                         (make-tree 9
                                    empty-tree
                                    (make-tree 11
                                               empty-tree
                                               empty-tree))))

(define tree2 (make-tree 3
                         (make-tree 1
                                    empty-tree
                                    empty-tree)
                         (make-tree 7
                                    (make-tree 5
                                               empty-tree
                                               empty-tree)
                                    (make-tree 9
                                               empty-tree
                                               (make-tree 11
                                                          empty-tree
                                                          empty-tree)))))

(define tree3 (make-tree 5
                         (make-tree 3
                                    (make-tree 1
                                               empty-tree
                                               empty-tree)
                                    empty-tree)
                         (make-tree 9
                                    (make-tree 7
                                               empty-tree
                                               empty-tree)
                                    (make-tree 11
                                               empty-tree
                                               empty-tree))))

(tree->list-1 tree1)
(tree->list-2 tree1)

(tree->list-1 tree2)
(tree->list-2 tree2)

(tree->list-1 tree3)
(tree->list-2 tree3)

;; b)
;; time complexity of `tree->list-2` grows slower