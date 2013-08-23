#lang scheme

(require rackunit)

(define (make-monitored f)
  (define call-count 0)
  (define (mf x)
    (cond [(eq? x 'how-many-calls?) call-count]
          [(eq? x 'reset-count) (begin (set! call-count 0)
                                       call-count)]
          [else (begin (set! call-count (+ call-count 1))
                       (f x))]))
  mf)

(test-begin
 (let ([s (make-monitored sqrt)]
       [t (make-monitored sin)])
   (check-equal? (s 'how-many-calls?) 0)
   (check-equal? (s 100) 10)
   (check-equal? (s 'how-many-calls?) 1)
   (check-equal? (t 'how-many-calls?) 0)
   (s 'reset-count)
   (check-equal? (s 'how-many-calls?) 0)))