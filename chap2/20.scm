#lang scheme

(define (same-parity . l)
  (define (sp-as parity li)
    (if (null? li) li
        (let [(first (car li))
              (rest (cdr li))]
          (if (= (remainder first 2) parity)
              (cons first (sp-as parity (cdr li)))
              (sp-as parity (cdr li))))))
  (cons (car l) (sp-as (remainder (car l) 2) (cdr l))))

;; > (same-parity 1 2 3 4 5 6 7)
;; (1 3 5 7)
;; > (same-parity 2 3 4 5 6 7)
;; (2 4 6)