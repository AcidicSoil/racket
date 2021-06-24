(require picturing-programs)
(require "ch15-pix.rkt")
; A light-color is any of the strings "green", "yellow", or "red".

#|
(check-expect (function-on-light-color "green") ...)
(check-expect (function-on-light-color "yellow") ...)
(check-expect (function-on-light-color "red") ...)
(define (function-on-light-color c)
(cond [(string=? c "green") ...]
[(string=? c "yellow") ...]
[(string=? c "red") ...]
))
|#

#|
(check-expect (function-returning-light-color ...) "green")
(check-expect (function-returning-light-color ...) "yellow")
(check-expect (function-returning-light-color ...) "red")
(define (function-returning-light-color c)
(cond [... "green"]
[... "yellow"]
[... "red"]
))
|#

; change-light : light-color -> light-color

(check-expect (change-light "green") "yellow")
(check-expect (change-light "yellow") "red")
(check-expect (change-light "red") "green")
(define (change-light color)
; color light-color
  (cond [(string=? color "green") "yellow"]
[(string=? color "yellow") "red"]
[(string=? color "red") "green"]))

; show-light : light-color -> image
(check-expect (show-light "green") (circle 30 "solid" "green"))
(check-expect (show-light "yellow") (circle 30 "solid" "yellow"))
(check-expect (show-light "red") (circle 30 "solid" "red"))
(define (show-light color)
; color light-color
(circle 30 "solid" color)
)

(big-bang "green"
(check-with string?)
(on-draw show-light)
(on-tick change-light 5)
)

; choose-picture : string -> Image

; choose-picture:string("basketball", "baseball", or "Monopoly")->
; image (basketball, baseball, or monopoly)

"Examples of choose-picture:"
(check-expect (choose-picture "basketball") basketball)
(check-expect (choose-picture "baseball") baseball)
(check-expect (choose-picture "Monopoly") monopoly)
(check-expect (choose-picture "cars") "invalid option")

(define (choose-picture string)
  (cond [(string=? string "basketball") basketball]
        [(string=? string "baseball") baseball]
        [(string=? string "Monopoly") monopoly]
        [else "invalid option"]
        ))


(define (slide-show image)
 (cond [()
