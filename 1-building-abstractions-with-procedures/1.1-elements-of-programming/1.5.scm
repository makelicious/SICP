; Exercise 1.5:
; Ben Bitdiddle has invented a test to determine whether the interpreter
; he is faced with is using applicative-order evaluation or normal-order evaluation.
; He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Then he evaluates the expression

(test 0 (p))


; What behavior will Ben observe with an interpreter that uses applicative-order evaluation?
; Program doesn't terminate. It is caught on infinite loop
; So when we call the function it evaluates the arguments right away. So we loop (p) over and over.


; What behavior will he observe with an interpreter that uses normal-order evaluation?
; Returns 0
; Function evaluates the arguments only when it is needed. Since the first condition is true we never have to evaluate (p)
