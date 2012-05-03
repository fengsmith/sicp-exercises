;; Exercise 1.5.  Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order
;; evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Then he evaluates the expression

;; (test 0 (p))

;; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter
;; that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the
;; interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate
;; the consequent or the alternative expression.)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Anwer: In applicative-order evaluation, the call to (p) is going to block the interpreter when calling test, since p will call itself
; infinitely. In normal-order evaluation, the test call is going to be just fine because (p) is going to end up in the alternative of the if,
; thus it won't be avaluated.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;