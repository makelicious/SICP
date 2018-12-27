; Exercise 1.3:
; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 2 3)

(define (find-smallest-number a b c)
  (if (>= a b)
    (if (>= b c) c b)
    (if (>= a c) c a)))

(find-smallest-number 1 2 3)

(define (sum-of-squares-of-two-greatest a b c)
  (if (= (find-smallest-number a b c) a)
    (sum-of-squares b c)
    (if (= (find-smallest-number a b c) b)
      (sum-of-squares a c) (sum-of-squares a b))))

(= (sum-of-squares-of-two-greatest 3 2 4) 25)
(= (sum-of-squares-of-two-greatest 2 3 4) 25)
(= (sum-of-squares-of-two-greatest 2 4 3) 25)
(= (sum-of-squares-of-two-greatest 3 4 2) 25)
(= (sum-of-squares-of-two-greatest 4 2 3) 25)
(= (sum-of-squares-of-two-greatest 4 3 2) 25)
