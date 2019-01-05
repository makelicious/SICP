; Exercise 1.13:
; Prove that Fib(n) is the closest integer to φ^n/⎯√5, where φ=(1+⎯√5)/2.
; Hint: Let ψ=(1−5⎯⎯√)/2.
; Use induction and the definition of the Fibonacci numbers (see 1.2.2)
; to prove that Fib(n)=(φn−ψn)/5⎯⎯√.

; φ = epsilon
; ψ = psi

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
    b
    (fib-iter (+ a b) a (- count 1))))

; 0.19098300562505258
(define (epsilon)
  (/ (+ 1 (sqrt 5)) 2))
; -0.6180339887498949
(define (psi)
  (/ (- 1 (sqrt 5)) 2))

(define (square-n-times x n total)
  (if (= n 0)
    total
    (square-n-times x (- n 1) (* total x))))


(define (psi-epsilon n)
  (/ (- (square-n-times (epsilon) n 1) (square-n-times (psi) n 1)) (sqrt 5)))

(define (closest-integer integer closest-approx)
  (< (- integer (abs closest-approx)) 0.5))

(closest-integer (fib 1) (psi-epsilon 1))
(closest-integer (fib 10) (psi-epsilon 10))
(closest-integer (fib 100) (psi-epsilon 100))
(closest-integer (fib 1000) (psi-epsilon 1000))
(closest-integer (fib 10000) (psi-epsilon 10000))
; (closest-integer (fib 100000) (psi-epsilon 100000)) goes to infinity
