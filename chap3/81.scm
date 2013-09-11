#lang scheme

(require "stream.scm")

;; the following is copied from
;; http://community.schemewiki.org/?SICP-Solutions

(define (random-update x)
  (remainder (+ (* 13 x) 5) 24))
(define random-init (random-update (expt 2 32)))

(define (random-number-generator command-stream)
  (define random-number
    (cons-stream
     random-init
     (stream-map (lambda (number command)
                   (cond ((null? command) the-empty-stream)
                         ((eq? command 'generator)
                          (random-update number))
                         ((and (pair? command)
                               (eq? (car command) 'reset))
                          (cdr command))
                         (else
                          (error "bad command -- " command))))
                 random-number
                 command-stream)))
  random-number)