#lang scheme

(require "46.scm"
         "48.scm")

(define segments->painter list)

;; a)
(segments->painter (list (make-segment (make-vect 0 0)
                                       (make-vect 0 1))
                         (make-segment (make-vect 0 0)
                                       (make-vect 1 0))
                         (make-segment (make-vect 1 0)
                                       (make-vect 1 1))
                         (make-segment (make-vect 0 1)
                                       (make-vect 1 1))))

;; b)
(segments->painter (list (make-segment (make-vect 0 0)
                                       (make-vect 1 1))
                         (make-segment (make-vect 0 1)
                                       (make-vect 1 0))))

;; c)
(segments->painter (list (make-segment (make-vect 0 0.5)
                                       (make-vect 0.5 0))
                         (make-segment (make-vect 0.5 0)
                                       (make-vect 1 0.5))
                         (make-segment (make-vect 1 0.5)
                                       (make-vect 0.5 1))
                         (make-segment (make-vect 0.5 1)
                                       (make-vect 0 0.5))))

;; d)
;; OMG, forget it!