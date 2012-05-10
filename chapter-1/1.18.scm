;; Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an
;; iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a
;; logarithmic number of steps.40

(define (halve n)
  (/ n 2))

(define (double n)
  (+ n n))

(define (mult-iter a b)
  (define (mult-iter-helper a b c)
    (cond ((= b 0) c)
          ((even? b) (mult-iter-helper (double a) (halve b) c))
          (else (mult-iter-helper a (- b 1) (+ a c)))))
  (mult-iter-helper a b 0))