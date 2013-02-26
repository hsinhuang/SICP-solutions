#lang scheme

(define (square x)
  (* x x))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (non-trivial a)
    (cond ((or (= a 1) (= a (- n 1))) a)
          ((= (remainder (square a) n) 1) 0)
          (else a)))
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (non-trivial (expmod base (/ exp 2) m)))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                    m))))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 561 100)
(fast-prime? 1105 250)
(fast-prime? 1729 300)
(fast-prime? 2465 600)
(fast-prime? 2821 700)
(fast-prime? 6601 1000)