;; Exercise 1.23.  The smallest-divisor procedure shown at the start of this section does lots of
;; needless testing: After it checks to see if the number is divisible by 2 there is no point in
;; checking to see if it is divisible by any larger even numbers. This suggests that the values used
;; for test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this
;; change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its
;; input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+
;; test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run
;; the test for each of the 12 primes found in exercise 1.22. Since this modification halves the number
;; of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If
;; not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact
;; that it is different from 2?

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes a b)
  (define (iter counter)
    (if (odd? counter)
        (timed-prime-test counter))
    (if (= counter b)
        ()
        (iter (1+ counter))))
  (iter a))
