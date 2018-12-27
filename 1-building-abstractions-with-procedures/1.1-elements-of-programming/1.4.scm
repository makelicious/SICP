; Exercise 1.4:
; Observe that our model of evaluation allows for combinations whose operators are compound expressions.
; Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


; The selected expression depends on the value of b
; Really cool since the expression (- / +) is actually evaluated so 'easily'
; I guess this must be a perk of s-expressions.
