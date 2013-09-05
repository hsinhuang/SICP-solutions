#lang scheme

(define or-gate-delay (+ and-gate-delay
                         (* 3 inverter-delay)))

(define (or-gate a1 a2 output)
  (let [(x1 (make-wire))
        (x2 (make-wire))
        (x3 (make-wire))]
    (inverter a1 x1)
    (inverter a2 x2)
    (and-gate x1 x2 x3)
    (inverter x3 output)
    'ok))