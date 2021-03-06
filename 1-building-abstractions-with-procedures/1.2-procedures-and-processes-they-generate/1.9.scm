; Exercise 1.9:
; Each of the following two procedures defines a method
; for adding two positive integers in terms of the procedures
; inc, which increments its argument by 1,
; and dec, which decrements its argument by 1.

; Using the substitution model, illustrate the process generated by each procedure
; in evaluating (+ 4 5). Are these processes iterative or recursive?

; Recursive process
; inc is lazily evaluated
; (inc (+ (dec 4) 5))
; (inc (inc (+ (dec 3) 5)))
; (inc (inc (inc (+ (dec 2) 5))))
; (inc (inc (inc (inc (+ (dec 1) 5)))))
; (inc (inc (inc (inc (inc (+ (dec 0) 5))))))
; (inc (inc (inc (inc (inc 5)))))
; (inc (inc (inc (inc  6))))
; (inc (inc (inc  7)))
; (inc (inc 8))
; (inc 9)
; 9

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))


; Iterative process
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
