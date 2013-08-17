#lang scheme

(require "accumulate.scm")

(provide flatmap)

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))