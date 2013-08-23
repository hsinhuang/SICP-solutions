#lang scheme

(define f
  (let ([smallest null])
    (lambda (x)
      (if (or (null? smallest) (< x smallest))
          (begin (set! smallest x)
                 smallest)
          smallest))))

(+ (f 0) (f 1))