#lang scheme

(require "stream.scm")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;; sum = 1
(define y (stream-filter even? seq))
;; sum = 6
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
;; sum = 10

(stream-ref y 7)
;; sum = 136
(display-stream z)