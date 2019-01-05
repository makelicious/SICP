; Exercise 1.11:
; A function f is defined by the rule that
; f(n)=n if n<3
; f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3.

; Write a procedure that computes f by means of a recursive process.
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))


; Write a procedure that computes f by means of an iterative process.


(define (f n)
  (if (< n 3)
  n
  (f-iter 1 2 3 n)))

(define (f-iter a b c n)
  (if (< n 3)
    c
    (f-iter (a b (+ a (* 3 c) (* 2 b)) (- n 1))))
