#lang scheme

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;the first expression in the parenthese
;need to be evaluated before being
;applied on the remaining parameters