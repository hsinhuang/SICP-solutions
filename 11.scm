#lang scheme

;recursive version
(define (f-r n)
  (if (< n 3)
      n
      (+ (f-r (- n 1))
         (* 2 (f-r (- n 2)))
         (* 3 (f-r (- n 3))))))

;iterative version
(define (f-i n)
  (define (iter a b c n)
    (if (= n 2)
        a
        (iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))
  (if (< n 3)
      n
      (iter 2 1 0 n)))

(define (test i)
  (= (f-r i) (f-i i)))