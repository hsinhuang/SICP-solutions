#lang scheme

(require rackunit
         "46.scm")

(define v0 (make-vect 0 0))
(define v1 (make-vect 1 1))
(define v2 (make-vect 7 3))
(define v3 (make-vect 2 3))

(define (vect-equal? v1 v2)
  (and (= (xcor-vect v1) (xcor-vect v2))
       (= (ycor-vect v1) (ycor-vect v2))))

(define file-tests
  (test-suite
   "Tests for 46.scm"
   
   (test-case
    "get x coordinates"
    (let ([v-x-pairs (list (cons v0 0)
                           (cons v1 1)
                           (cons v2 7)
                           (cons v3 2))])
      (for-each
       (lambda (v-x)
         (check-equal? (xcor-vect (car v-x)) (cdr v-x)))
       v-x-pairs)))
   
   (test-case
    "get y coordinates"
    (let ([v-y-pairs (list (cons v0 0)
                           (cons v1 1)
                           (cons v2 3)
                           (cons v3 3))])
      (for-each
       (lambda (v-y)
         (check-equal? (ycor-vect (car v-y)) (cdr v-y)))
       v-y-pairs)))
   
   (test-case
    "vector addition"
    (let ([vs (list v0 v1 v2 v3)])
      (for-each
       (lambda (vx)
         (check-pred (lambda (v) (vect-equal? v vx))
                     (add-vect vx v0)))
       vs))
    (let ([v1-v2-ans-ps (list (cons (cons v1 v2) (make-vect 8 4))
                              (cons (cons v1 v3) (make-vect 3 4))
                              (cons (cons v3 v2) (make-vect 9 6))
                              (cons (cons v2 v1) (make-vect 8 4))
                              (cons (cons v3 v1) (make-vect 3 4))
                              (cons (cons v2 v3) (make-vect 9 6)))])
      (for-each
       (lambda (v1-v2-ans)
         (check-pred (lambda (v) (vect-equal? v (cdr v1-v2-ans)))
                     (add-vect (caar v1-v2-ans) (cdar v1-v2-ans))))
       v1-v2-ans-ps)))
   
   (test-case
    "vector substraction"
    (let ([vs (list v0 v1 v2 v3)])
      (for-each
       (lambda (vx)
         (check-pred (lambda (v) (vect-equal? v vx))
                     (sub-vect vx v0)))
       vs))
    (let ([v1-v2-ans-ps (list (cons (cons v1 v2) (make-vect -6 -2))
                              (cons (cons v1 v3) (make-vect -1 -2))
                              (cons (cons v3 v2) (make-vect -5 0))
                              (cons (cons v2 v1) (make-vect 6 2))
                              (cons (cons v3 v1) (make-vect 1 2))
                              (cons (cons v2 v3) (make-vect 5 0)))])
      (for-each
       (lambda (v1-v2-ans)
         (check-pred (lambda (v) (vect-equal? v (cdr v1-v2-ans)))
                     (sub-vect (caar v1-v2-ans) (cdar v1-v2-ans))))
       v1-v2-ans-ps)))
   
   (test-case
    "vector scale"
    (let ([vs (list v0 v1 v2 v3)])
      (for-each
       (lambda (vx)
         (check-pred (lambda (v) (vect-equal? v vx))
                     (scale-vect vx 1)))
       vs))
    (let ([vs (list v0 v1 v2 v3)])
      (for-each
       (lambda (vx)
         (check-pred (lambda (v) (vect-equal? v v0))
                     (scale-vect vx 0)))
       vs))
    (let ([v1-v2-ans-ps (list (cons (cons v1 2) (make-vect 2 2))
                              (cons (cons v1 3) (make-vect 3 3))
                              (cons (cons v3 2) (make-vect 4 6))
                              (cons (cons v2 4) (make-vect 28 12))
                              (cons (cons v3 7) (make-vect 14 21))
                              (cons (cons v2 3) (make-vect 21 9)))])
      (for-each
       (lambda (v1-v2-ans)
         (check-pred (lambda (v) (vect-equal? v (cdr v1-v2-ans)))
                     (scale-vect (caar v1-v2-ans) (cdar v1-v2-ans))))
       v1-v2-ans-ps)))))

(require rackunit/text-ui)
(run-tests file-tests)