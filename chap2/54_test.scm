#lang scheme

(require rackunit
         "54.scm")

(define file-tests
  (test-suite
   "Tests for 54.scm"
   
   (test-case
    "check equal? for symbols"
    (let ([egs (list (cons (cons '(this is it) (list 'this 'is 'it))
                           #t)
                     (cons (cons '(thees (it)) (list 'thees '(it)))
                           #t)
                     (cons (cons '(this i it) (list 'this 'is 'it))
                           #f)
                     (cons (cons '(this is it) (list 'this '(is) 'it))
                           #f)
                     (cons (cons '(this '(is) it) (list 'this '(is) 'it))
                           #f)
                     (cons (cons '(1 2 3) (list '1 '2 '3))
                           #t))])
      (for-each
       (lambda (eg)
         (check-equal? (equal? (caar eg) (cdar eg))
                       (cdr eg)))
       egs)))
   
   (test-case
    "check equal? for numbers"
    (let ([egs (list (cons (cons '(1 2 3) (list 1 2 3))
                           #t)
                     (cons (cons '(1 2.0 3) (list 1 2 3.0))
                           #t)
                     (cons (cons '(1 2 3) (list 1 2 2))
                           #f)
                     (cons (cons '(1 1/2 3) (list 1 0.5 3))
                           #t))])
      (for-each
       (lambda (eg)
         (check-equal? (equal? (caar eg) (cdar eg))
                       (cdr eg)))
       egs)))))


(require rackunit/text-ui)
(run-tests file-tests)