#lang scheme

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ([first (eval (first-operand exps) env)]
            [rest (list-of-values (rest-operands exps) env)])
        (cons first rest)))