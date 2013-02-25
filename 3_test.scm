#lang scheme

(require "3.scm")

(define test
  (and (= (sum-of-bigger-two 1 2 3) 5)
       (= (sum-of-bigger-two 4 2 3) 7)
       (= (sum-of-bigger-two 4 5 3) 9)
       (= (sum-of-bigger-two 4 4 3) 8)
       (= (sum-of-bigger-two 4 5 5) 10)
       (= (sum-of-bigger-two 7 5 7) 14)
       (= (sum-of-bigger-two 3 3 3) 6)))

(if test
    (display "===PASS===")
    (display "===FAIL==="))