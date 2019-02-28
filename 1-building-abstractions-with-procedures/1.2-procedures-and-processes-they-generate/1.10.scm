; Exercise 1.10:
; The following procedure computes a mathematical function called Ackermann’s function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

(A 1 10)
; 1024
(A 2 4)
(A 3 3)
; 65536
; 65536

; Consider the following procedures, where A is the procedure defined above:
; Give concise mathematical definitions for the functions
; computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n2.

(define (f n) (A 0 n))
; 2n
(define (g n) (A 1 n))
; (A 1 y)
; (A 0 (A 1 (- y 1)))
; (A 0 (A 0 (A 1 (- y 1)))
; (A 0 (A 0 (A 0 (A 1 (- y 1)))))
; This goes all over until y hits one
; the space of the function grows linearly with n
; Then the right-most A gets value of 2 explicitly
; Then we start substituting the (A 0 y) functions that always return (* 2 y)
; and we get 2^n

(define (h n) (A 2 n))
; (h 2)
; (A 2 y)
; (A 1 (A 2 (- y 1))
; (A 1 (A 1 (A 2 (- y 1))))
; So the space grows linearily again until y = 1
; For example
; (A 2 2)
; (A 1 (A 2 1))
; (A 1 2)
; See that here this start to differ from the last example. We again start recursion
; because (A 1 2) cannot be directly subsituted
; (A 0 (A 0 1))
; (A 0 2)
; 4

; (h 3)
; (A 2 3)
; (A 1 (A 2 2))
; (A 1 (A 1 (A 2 1)))
; (A 1 (A 1 2))
; (A 1 (A 0 (A 1 1)))
; (A 1 (A 0 2)
; (A 1 4)
; (A 0 (A 1 3))
; (A 0 (A 0 (A 1 2)))
; (A 0 (A 0 (A 0 (A 1 1))))
; (A 0 (A 0 (A 0 2)))
; (A 0 (A 0 4))
; (A 0 8)
; 16

; (h 4)
; 65536

; Here we can see that using function h values grow exponentially.
; (h 4) ->  65536 -> 2^16 -> 2^2^2^2^2 (length 5)
; (h 3) -> 16 -> 2^4 -> 2^2^2 (length 3)
; (h 2) -> 4 -> 2^2 -> 2^2 (length 2)
; If we take 2^2 as the base case we can see; 2^2^...(n -1)
(define (k n) (* 5 n n))
; 5n2
