#lang scheme

(require rackunit
         "47-a.scm")

(define f (make-frame 1 2 3))

(define file-tests
  (test-suite
   "Tests for 47-a.scm"
   
   (test-case
    "get origin"
    (check-equal? 1 (origin-frame f)))
   
   (test-case
    "get edge1"
    (check-equal? 2 (edge1-frame f)))
   
   (test-case
    "get edge2"
    (check-equal? 3 (edge2-frame f)))))

(require rackunit/text-ui)
(run-tests file-tests)