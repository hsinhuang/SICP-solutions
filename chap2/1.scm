#lang scheme

(define (make-rat n d)
  (letrec ((g (gcd n d))
           (new-n (abs (/ n g)))
           (new-d (abs (/ d g)))
           (m (* n d)))
    (cond ((= new-d 0) (error "denominator cannot be 0"))
          ((< m 0) (cons (- new-n) new-d))
          (else (cons new-n new-d)))))