;; Exercise 1.3. Define a procedure that takes three numbers as arguments and returns the sums of the squares of the two larger numbers.

(define (sum-of-two-larger a b c)
  (if (> a b)
      (if (> b c)
          (+ a b)
          (+ a c))
      (if (> c a)
          (+ b c)
          (+ b a))))