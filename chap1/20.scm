#lang scheme

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;regular order:
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;;;(remainder 206 40) => 6
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;;(remainder 40 (remainder 206 40)) => (remainder 40 6) => 4
;(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;;(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) => 2
;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;;;(remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) => 0
;;;(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) => 2
;so remainder has been called for 18 times
;if is application order, it should be called for (remainder 206 40)