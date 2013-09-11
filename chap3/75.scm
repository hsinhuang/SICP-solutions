#lang scheme

(require "stream.scm")

(define (sign-change-detector b a)
  (let ([a>0 (> a 0)]
        [b>0 (> b 0)]
        [a<0 (< a 0)]
        [b<0 (< b 0)])
    (cond [(and a>0 b<0) -1]
          [(and a<0 b>0) 1]
          [else 0])))

(define (make-zero-crossings input-stream last-value last-avpt)
  (let ([avpt (/ (+ (stream-car input-stream) last-value) 2)])
    (cons-stream
     (sign-change-detector avpt last-avpt)
     (make-zero-crossings (stream-cdr input-stream)
                          (stream-car input-stream)
                          avpt))))

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

(define zero-crossings0 (make-zero-crossings sense-data 0 0))