;; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.
;;      1
;;     1 1
;;    1 2 1
;;   1 3 3 1
;;  1 4 6 4 1
;; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of
;; the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means
;; of a recursive process.

(define (pascal-triangle rows)
  (define (pascal-triangle-element row col)
    (cond ((or (= col 1) (= col row)) 1)
          ((or (< col 1) (> col row)) 0)
          (else (+ (pascal-triangle-element (- row 1) (- col 1))
                   (pascal-triangle-element (- row 1) col)))))
  (define (pascal-row row column)
    (if (> column row)
        ()
        (cons (pascal-triangle-element row column)
              (pascal-row row (+ column 1)))))
  (define (pascal-collector counter)
    (if (> counter rows)
        ()
        (cons (pascal-row counter 1)
              (pascal-collector (+ counter 1)))))
  (pascal-collector 1))

;; NOTE: I cheated a bit here, using lists which we are not supposed to know at this stage of the book.
;; Other than that I try to use what we "know" (like adding/substracting 1 instead of calling 1+/-1+)

;; (pascal-triangle 6)

;Value 25: ((1) (1 1) (1 2 1) (1 3 3 1) (1 4 6 4 1) (1 5 10 10 5 1))