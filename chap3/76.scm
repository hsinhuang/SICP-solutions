#lang scheme

(require "stream.scm")

(define (smooth s)
  (if (or (stream-null? s) (stream-null? (stream-cdr s)))
      the-empty-stream
      (cons-stream (/ (+ (stream-car s) (stream-car (stream-cdr s)))
                      2.0)
                   (smooth (stream-cdr s)))))

(define (sign-change-detector b a)
  (let ([a>0 (> a 0)]
        [b>0 (> b 0)]
        [a<0 (< a 0)]
        [b<0 (< b 0)])
    (cond [(and a>0 b<0) -1]
          [(and a<0 b>0) 1]
          [else 0])))

(define (make-zero-crossings input-stream last-value)
  (define (zero-crossings input-stream last-value)
    (cons-stream
     (sign-change-detector (stream-car input-stream) last-value)
     (zero-crossings (stream-cdr input-stream)
                     (stream-car input-stream))))
  (zero-crossings (smooth (cons-stream last-value input-stream))
                  last-value))

(define sense-data
  (cons-stream
   1
   (cons-stream
    2
    (cons-stream
     1.5
     (cons-stream
      1
      (cons-stream
       0.5
       (cons-stream
        -0.1
        (cons-stream
         -2
         (cons-stream
          -3
          (cons-stream
           -2
           (cons-stream
            -0.5
            (cons-stream
             0.2
             (cons-stream
              3
              (cons-stream
               4
               the-empty-stream))))))))))))))

(define zero-crossings0 (make-zero-crossings sense-data 0))