#lang scheme

(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div L1
                          (add L1 (mul (make-term new-o (- new-c)) L2)))
                     ))
                (add rest-of-result
                     (make-polynomial 'x
                                      (adjoin-term (make-term new-o new-c)
                                                   (the-empty-termlist))))
                ))))))