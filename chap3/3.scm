#lang scheme

(require rackunit)

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pw m)
    (if (not (eq? pw password))
        (lambda (x) "Incorrect password")
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))))
  dispatch)

(test-begin
 (let ([acc (make-account 100 'secret-password)])
   (check-equal? ((acc 'secret-password 'withdraw) 40) 60)
   (check-equal? ((acc 'some-other-password 'deposit) 50)
                 "Incorrect password")))