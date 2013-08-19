#lang scheme

(require "../chap1/fast-expt.scm")

(define (** base expt) (fast-expt base expt))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

;; construct list of addition and multiplication
(define (make-sum a1 a2)
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
        [(and (number? a1) (number? a2)) (+ a1 a2)]
        [else (list a1 '+ a2)]))

(define (make-product m1 m2)
  (cond [(or (=number? m1 0) (=number? m2 0)) 0]
        [(=number? m1 1) m2]
        [(=number? m2 1) m1]
        [(and (number? m1) (number? m2)) (* m1 m2)]
        [else (list m1 '* m2)]))

(define (in-list? items x)
  (if (null? items)
      #f
      (or (equal? (car items) x)
          (in-list? (cdr items) x))))

(define (list-index items x)
  (define (index items idx c)
    (cond [(null? items) idx]
          [(equal? (car items) x) c]
          [else (index (cdr items) idx (+ c 1))]))
  (index items -1 0))

(define priority (list '+ '* '**))

;; return a list of symbols in `pri` that prior than `c`
(define (prior-ones pri c)
  (if (not (in-list? priority c))
      null
      (filter (lambda (x) (> (list-index priority x)
                             (list-index priority c)))
              pri)))

;; return a list of symbols in `pri` that less prior than `c`
(define (less-prior-ones pri c)
  (if (not (in-list? priority c))
      null
      (filter (lambda (x) (< (list-index priority x)
                             (list-index priority c)))
              pri)))

(define (calc-symbols items)
  (filter (lambda (x) (in-list? priority x)) items))

;; whether the least prior calculating symbol
;; of the fomula `fm` is `c`
(define (fomula-type? fm c)
  (let ([syms (calc-symbols fm)])
    (and (= (length (less-prior-ones syms c)) 0)
         (not (= (length (prior-ones syms c)) (length syms))))))

;; is the list an addition formula
(define (sum? x)
  (and (list? x) (fomula-type? x '+)))

(define (addend s) (car s))
(define (augend s)
  (if (= (length (cddr s)) 1)
      (caddr s)
      (cddr s)))

;; is the list a multipication formula
(define (product? x)
  (and (list? x) (fomula-type? x '*)))

(define (multiplier s) (car s))
(define (multiplicand s)
  (if (= (length (cddr s)) 1)
      (caddr s)
      (cddr s)))

(define (exponentiation? x)
  (and (list? x) (= (length x) 3) (fomula-type? x '**)))

(define (base x) (car x))
(define (exponent x) (caddr x))

(define (make-exponentiation base expt)
  (cond [(=number? base 0) 0]
        [(=number? expt 0) 1]
        [(=number? base 1) 1]
        [(=number? expt 1) base]
        [(and (number? base) (number? expt)) (** base expt)]
        [else (list base '** expt)]))

(define (deriv exp var)
  (cond [(number? exp) 0]
        [(variable? exp)
         (if (same-variable? exp var) 1 0)]
        [(sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))]
        [(product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp)))]
        [(exponentiation? exp)
         (make-product
          (make-exponentiation (base exp)
                               (make-sum (exponent exp) -1))
          (make-product (exponent exp)
                        (deriv (base exp) var)))]
        [else
         (error "unknown expression type -- DERIV" exp)]))