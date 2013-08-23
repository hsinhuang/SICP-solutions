#lang scheme

(define random-init 7)

(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define rand
  (let ((x random-init))
    (lambda (code)
      (cond [(eq? code 'generate)
             (set! x (rand-update x))
             x]
            [(eq? code 'reset)
             (lambda (new-v)
               (set! x new-v)
               x)]))))