#lang scheme

(require "enumerate-interval.scm")
(require "flatmap.scm")

(define empty-board null)

(define (safe? k positions)
  (define (danger? p1 p2)
    (or (= (car p1) (car p2))
        (= (cdr p1) (cdr p2))
        (= (abs (- (car p1) (car p2)))
           (abs (- (cdr p1) (cdr p2))))))
  (define (check-safety-seq i)
    (if (= i k)
        #t
        (and (not (danger? (cons i (list-ref positions (- i 1)))
                           (cons k (list-ref positions (- k 1)))))
             (check-safety-seq (+ i 1)))))
  (check-safety-seq 1))

(define (adjoin-position new-row k positions-of-queens)
  (define (list-mut li pos new-val)
    (if (= pos 1)
        (cons new-val (cdr li))
        (cons (car li) (list-mut (cdr li) (- pos 1) new-val))))
  (if (= (- k 1) (length positions-of-queens))
      (append positions-of-queens (list new-row))
      (list-mut positions-of-queens k new-row)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))