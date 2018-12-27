; Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
; “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks.
; Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate
  then-clause
  else-clause)
(cond (predicate then-clause)
(else else-clause)))

; Eva demonstrates the program for Alyssa:

; (new-if (= 2 3) 0 5)
; 5

; (new-if (= 1 1) 0 5)
; 0


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))


; What happens when Alyssa attempts to use this to compute square roots? Explain.
; Using new-if gets us to infinite loop
; if and cond are both special forms and have their own evaluation rules. (They evaluate values lazily)

; new-if is implemented using cond wrapped inside a function.
; Like in Exercise 1.5 we learned Scheme uses applicative-order-evalution.
; This results to us evaluating all the arguments before using them. We loop over and over but we never get to actually evaluating predicates.


; Previous definition
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))
