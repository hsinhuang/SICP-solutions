#lang scheme

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (cesaro-test P x1 x2 y1 y2)
   (P (random-in-range x1 x2) (random-in-range y1 y2)))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (* (abs (- x2 x1))
     (abs (- y2 y1))
     (monte-carlo trials
                  (lambda () (cesaro-test P x1 x2 y1 y2)))))