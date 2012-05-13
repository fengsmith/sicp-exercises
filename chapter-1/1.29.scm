;; Exercise 1.29.  Simpson's Rule is a more accurate method of numerical integration than the method
;; illustrated above. Using Simpson's Rule, the integral of a function f between a and b is
;; approximated as


;; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing n increases the
;; accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and
;; returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate
;; cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral
;; procedure shown above.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (identity x) x)

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (simpson-rule x)
    (define coefficient (cond ((or (= x 0) (= x n)) 1)
                              ((odd? x) 4)
                              (else 2)))
    (* coefficient (f (+ a (* h x)))))
  (* (/ h 3) (sum simpson-rule 0 1+ n)))

