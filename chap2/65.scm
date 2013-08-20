#lang scheme

(require "63.scm"
         "64.scm")

(define (union-set set1 set2)
  (define (union-ol-set set1 set2)
    ;; union sets based on ordered list
    (cond [(null? set1) set2]
          [(null? set2) set1]
          [else
           (let ([x1 (car set1)]
                 [x2 (car set2)])
             (cond [(= x1 x2) (cons x1
                                    (union-ol-set (cdr set1)
                                                  (cdr set2)))]
                   [(< x1 x2) (cons x1
                                    (union-ol-set (cdr set1)
                                                  set2))]
                   [else (cons x2
                               (union-ol-set set1
                                             (cdr set2)))]))]))
  (list->tree (union-ol-set (tree->list-2 set1)
                            (tree->list-2 set2))))

(define (intersection-set set1 set2)
  (define (intersection-ol-set set1 set2)
    ;; intersect sets based on ordered list
    (if (or (null? set1) (null? set2))
        null
        (let ([x1 (car set1)]
              [x2 (car set2)])
          (cond [(= x1 x2) (cons x1
                                 (intersection-ol-set (cdr set1)
                                                      (cdr set2)))]
                [(< x1 x2) (intersection-ol-set (cdr set1) set2)]
                [else (intersection-ol-set set1 (cdr set2))]))))
  (list->tree (intersection-ol-set (tree->list-2 set1)
                                   (tree->list-2 set2))))