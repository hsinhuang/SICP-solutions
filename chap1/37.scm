#lang scheme

(provide (all-defined-out))

;iterative version
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

;(cont-frac (lambda (x) 1.0)
;           (lambda (x) 1.0)
;           100)

;recursive version
(define (cont-frac-r n d k)
  (define (recr i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (recr (+ i 1))))))
  (recr 1))