#lang scheme

(provide (all-defined-out))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y) 
   ;; endpoint-sign returns: 
   ;;     +1 if both endpoints non-negative, 
   ;;     -1 if both negative, 
   ;;      0 if opposite sign 
   (define (endpoint-sign i) 
     (cond ((and (>= (upper-bound i) 0) 
                 (>= (lower-bound i) 0)) 
            1) 
           ((and (< (upper-bound i) 0) 
                 (< (lower-bound i) 0)) 
            -1) 
           (else 0))) 
  
   (let ((es-x (endpoint-sign x)) 
         (es-y (endpoint-sign y)) 
         (x-up (upper-bound x)) 
         (x-lo (lower-bound x)) 
         (y-up (upper-bound y)) 
         (y-lo (lower-bound y))) 
  
     (cond ((> es-x 0) ;; both x endpoints are +ve or 0 
            (cond ((> es-y 0) 
                   (make-interval (* x-lo y-lo) (* x-up y-up))) 
                  ((< es-y 0) 
                   (make-interval (* x-up y-lo) (* x-lo y-up))) 
                  (else 
                   (make-interval (* x-up y-lo) (* x-up y-up))))) 
  
           ((< es-x 0) ;; both x endpoints are -ve 
            (cond ((> es-y 0) 
                   (make-interval (* x-lo y-up) (* x-up y-lo))) 
                  ((< es-y 0) 
                   (make-interval (* x-up y-up) (* x-lo y-lo))) 
                  (else 
                   (make-interval (* x-lo y-up) (* x-up y-lo))))) 
  
           (else  ;; x spans 0 
            (cond ((> es-y 0) 
                   (make-interval (* x-lo y-up) (* x-up y-up))) 
                  ((< es-y 0) 
                   (make-interval (* x-up y-lo) (* x-lo y-lo))) 
                  (else 
                   ;; Both x and y span 0 ... need to check values 
                   (make-interval (min (* x-lo y-up) (* x-up y-lo)) 
                                  (max (* x-lo y-lo) (* x-up y-up)))))))))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound)))
      (error "divisor cannot cross 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (print-interval x)
  (newline)
  (display "(")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display ")"))

(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))

(define (lower-bound x) (car x))

(define x (make-interval 3.9 4.1))
(define y (make-interval 0.9 1.1))

;(print-interval (add-interval x y))
;(print-interval (mul-interval x y))
;(print-interval (div-interval x y))