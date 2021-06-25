(require picturing-programs)
(require "ch15-pix.rkt")

(define (light-color? thing)
  (or(string=? thing "green")
     (string=? thing "yellow")
     (string=? thing "red")))

; A light-color is any of the strings "green", "yellow", or "red".
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
  (circle 30 "solid" color))

(big-bang "green"
  (check-with light-color?)
  (on-draw show-light)
  (on-tick change-light 5))

; choose-picture : string -> Image
; choose-picture: string("basketball", "baseball", or "Monopoly")->
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

(define (change-picture image)
  (cond [(image=? image basketball) baseball]
        [(image=? image baseball) monopoly]
        [(image=? image monopoly) basketball]))

(define (show-picture image)
  image)

(define (slide-show image)
  (big-bang image
    (check-with image?)
    (on-draw show-picture)
    (on-tick change-picture 3)))

(slide-show basketball)

; change-light with image as model

(define (light-colorv2? thing)
  (or(image=? thing (circle 30 "solid" "green"))
     (string=? thing (circle 30 "solid" "yellow"))
     (string=? thing (circle 30 "solid" "red"))))

; A light-color is any of the strings "green", "yellow", or "red".
; change-light : light-color -> light-color
(check-expect (change-lightv2 (circle 30 "solid" "green")) (circle 30 "solid" "yellow"))
(check-expect (change-lightv2 (circle 30 "solid" "yellow")) (circle 30 "solid" "red"))
(check-expect (change-lightv2 (circle 30 "solid" "red")) (circle 30 "solid" "green"))
(define (change-lightv2 image)
  ; color light-color
  (cond [(image=? image green-light) yellow-light]
        [(image=? image yellow-light) red-light]
        [(image=? image red-light) green-light]))

; show-light : light-color -> image
(check-expect green-light (circle 30 "solid" "green"))
(check-expect yellow-light (circle 30 "solid" "yellow"))
(check-expect red-light (circle 30 "solid" "red"))

(define green-light
  (circle 30 "solid" "green"))

(define yellow-light
  (circle 30 "solid" "yellow"))

(define red-light 
  (circle 30 "solid" "red"))
  
(define (light-world image)
  (big-bang image
    (check-with light-colorv2?)
    (on-draw show-light)
    (on-tick change-lightv2 5))

  (light-world green-light)
