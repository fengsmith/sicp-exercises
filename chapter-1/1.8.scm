;; Exercise 1.8.  Newton's method for cube roots is based on the fact that if y is an approximation to
;; the cube root of x, then a better approximation is given by the value
;; (x / y^2 + 2y) / 3

;;Use this formula to implement a cube-root procedure analogous to the square-root procedure.

(define (cbrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess x)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* guess 2)) 3))

(define (good-enough? guess previous-guess x)
  (< (abs (- guess previous-guess)) 0.0001))

(define (cbrt x)
  (cbrt-iter 1.0 0.0 x))
