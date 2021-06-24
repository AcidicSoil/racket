; checkerbox
(define (make-diag-red-stripes x y)
  (cond[(odd? (- (quotient y 5)(quotient x 5)))  red]
       [else blue]))
;other tests
(define (make-diag-test1 x y)
  (cond[(odd? (- y(quotient x 5)))  red]
       [else blue]))                           

;.

(define (make-diag-test2 x y)
  (cond[(odd? (- 150(quotient x 5)))  red]
       [else blue]))

;.

(define (make-diag-test3 x y)
  (cond[(odd? (- (quotient x 5)(quotient y 5)))  red]
       [else blue]))
;.

(define (make-diag-test4 x y)
  (cond[(odd? (* (quotient x 5)(quotient y 5)))  red]
       [else blue]))
;.

(define (make-diag-test5 x y)
  (cond[(odd? (real->int(* (quotient y 5)(/ WIDTH HEIGHT)))) red]
       [else blue]))
;.

(define (make-diag-test6 x y)
  (cond[(odd? (quotient (real->int(abs (- (* y 2.55) (* x 2.55))))5)) red]
       [else blue]))
;.

(define (make-diag-test7 x y)
  (cond[(odd? (quotient (real->int(abs (- 150 (* y 2.55))))5)) red]
       [else blue]))
;.

(define (make-diag-test8 x y)
  (cond[(odd? (quotient (- y x)5)) red]
       [else blue]))
;.

(define (make-diag-test9 x y)
  (cond[(odd? (quotient (real->int(abs (- 100 (* x y))))5)) red]
       [else blue]))
;.

(define (make-diag-test10 x y)
  (cond[(odd? (* y(quotient (real->int(abs (- (* y x)(- x y))))5))) red]
       [else blue]))
;.

(define (make-diag-test11 x y)
  (cond[(odd? (* y(quotient (real->int(abs (- y(- y x))))5))) red]
       [else blue]))
;.

(define (make-diag-test12 x y)
  (cond[(odd? (* y(quotient (real->int(abs (- (* x(quotient y 5)(- y x)))))5))) red]
       [else blue]))
;.

(define (make-diag-test13 x y)
  (cond[(odd? (quotient (real->int(abs (- (* x y)(- y x))))5)) red]
       [else blue]))
;.


(define (make-diag-test14 x y)
  (cond[(odd? (quotient (real->int(abs (* (* x y)(- y x))))5)) red]
       [else blue]))
;.

(define (make-diag-test15 x y)
  (cond[(odd? (- y(quotient (- y x)5))) red]
       [else blue]))
;.

(define (make-diag-test16 x y)
  (cond[(odd? (- x(quotient (- y x)5))) red]
       [else blue]))
;.
(define (make-diag-test17 x y)
  (cond[(odd?  (- (quotient y 5)x)) red]
       [else blue]))
;.
(define (make-diag-test18 x y)
  (cond[(odd?  (* (quotient y 5) x)) red]
       [else blue]))
;.

(define (make-diag-test19 x y)
  (cond[(odd?  (- x(- (quotient y 5) y))) red]
       [else blue]))
;.

(define (make-diag-test20 x y)
  (cond[(odd?  (- (max  x ) (max  y ))) red]
       [else blue]))
;.
