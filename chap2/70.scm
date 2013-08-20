#lang scheme

(require "huffman.scm")

(define ht
  (generate-huffman-tree
   '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))

(length (encode '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA
                      NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP
                      YIP YIP YIP YIP SHA BOOM) ht))
;; 84 bits
;; if we used a fixed-length code, each symbol will be
;; encoded in 3 bits, so 108 bits is needed in total