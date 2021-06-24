#|
(check-expect (function-on-greeting "good morning") ...)
(check-expect (function-on-greeting "good afternoon") ...)
(check-expect (function-on-greeting "good night") ...)
(define (function-on-greeting greeting)
; greeting a greeting, as defined above
(cond [(string=? greeting "good morning") ...]
[(string=? greeting "good afternoon") ...]
[(string=? greeting "good night") ...]
))
|#

; A bank-balance is a number, in one of the categories
; 0-500 (not including 500); 500-1000 (not including 1000);
; 1000-4000 (not including 4000); and 4000-up.

#|
(check-expect (function-on-bank-balance 200) ...)
(check-expect (function-on-bank-balance 500) ...)
(check-expect (function-on-bank-balance 800) ...)
(check-expect (function-on-bank-balance 1000) ...)
(check-expect (function-on-bank-balance 2000) ...)
(check-expect (function-on-bank-balance 4000) ...)
(check-expect (function-on-bank-balance 7500) ...)
(define (function-on-bank-balance balance)
; balance a bank-balance
(cond [(< balance 500) ...]
[(and (>= balance 500)
(< balance 1000) ...]
[(and (>= balance 1000)
(< balance 4000) ...]
[(>= balance 4000) ...]
))
|#

; bank-interest-rate : bank-balance ->
; number (either 0, 0.01, 0.02, or 0.03)

(check-expect (bank-interest-rate 200) 0.00)
(check-expect (bank-interest-rate 500) 0.01)
(check-expect (bank-interest-rate 800) 0.01)
(check-expect (bank-interest-rate 1000) 0.02)
(check-expect (bank-interest-rate 2000) 0.02)
(check-expect (bank-interest-rate 4000) 0.03)
(check-expect (bank-interest-rate 7500) 0.03)
(define (bank-interest-rate balance)
; balance a bank-balance
(cond [(< balance 500) 0.00 ]
[(and (>= balance 500)
(< balance 1000)) 0.01 ]
[(and (>= balance 1000)
(< balance 4000)) 0.02 ]
[(>= balance 4000) 0.03 ]
))

; customer-type : bank-balance -> string
; ("rich", "moderate", "poor", or "college student")

(check-expect (customer-type 200) "college student")
(check-expect (customer-type 500) "poor")
(check-expect (customer-type 800) "poor")
(check-expect (customer-type 1000) "moderate")
(check-expect (customer-type 2000) "moderate")
(check-expect (customer-type 4000) "rich")
(check-expect (customer-type 7500) "rich")
(define ( customer-type balance)
; balance a bank-balance
(cond [(< balance 500) "college student" ]
[(and (>= balance 500)
(< balance 1000)) "poor" ]
[(and (>= balance 1000)
(< balance 4000)) "moderate" ]
[(>= balance 4000) "rich" ]
))

#|
(check-expect (function-returning-answer ...) "I need coffee")
(check-expect (function-returning-answer ...) "I need a nap")
(check-expect (function-returning-answer ...) "bedtime!")
(define (function-returning-answer whatever)
(cond [... "I need coffee"]
[... "I need a nap"]
[... "bedtime!"]
))
|#


