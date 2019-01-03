; Exercise 1.7:
; Explain these sftatements, with examples showing how the test fails for small and large numbers.
; 1.
; > The good-enough? test used in computing square roots
; > will not be very effective for finding the square roots of very small numbers.
;
; Since the definition of good enough is only 0.001 the correctness of the iteration is bound by it
; So if the actual square root is way less than that (or any arbitary value) all we get is just an approximation
; 2.
; > Also, in real computers, arithmetic operations are almost always performed with limited precision.
; > This makes our test inadequate for very large numbers.
;
; Floating point precision is about 6-8 digits depenging on stuff. (https://www.exploringbinary.com/decimal-precision-of-binary-floating-point-numbers/)
; So what happens if the square of x is over that? It gets inprecise.



; An alternative strategy for implementing good-enough?
; is to watch how guess changes from one iteration to the next
; and to stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end test.
; Does this work better for small and large numbers?
;____________________-
; In my tests it didn't differ for really large numbers,
; since the floating point precision is not precise enough
; For smaller numbers it gives marginally better results.
;


(define (sqrt-iter guess x previous-guess)
  (if (good-enough? guess x previous-guess)
      guess
      (sqrt-iter (improve guess x) x guess)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x previous-guess)
  (< (abs (- (square guess) x)) (* previous-guess 0.001)))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x 0.1))


; at this stage the program goes to infinite loop
(sqrt 10003200000000000000000000000000000000000000000000000000000000)
; 1.0001599872020476e+30 old good-enough
(sqrt 1000320000000000000000000000000000000000000000000000000000000)
; 1.0001599872020476e+30 new good-enough
(sqrt 1000320000000000000000000000000000000000000000000000000000000)

; 0.3162961255326064 is correct til the 5th decimal
(sqrt 0.100032)
; way off
(sqrt 0.000032)
