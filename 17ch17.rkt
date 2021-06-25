(require picturing-programs)
(require "ch15-pix.rkt")
(require "ch.10_pix.rkt")

(define green-light
  (circle 30 "solid" "green"))

(define yellow-light
  (circle 30 "solid" "yellow"))

(define red-light 
  (circle 30 "solid" "red"))

(define (light-color?v1 thing)
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

(define box
  (rectangle 80 210 "outline" "black"))

(define WIDTH 70)
(define HEIGHT 180)
(define LIGHT-METRICS
  (image-height green-light))

(define green-light-pos
  (place-image/align green-light
                     (/ WIDTH 2) (- HEIGHT (/ LIGHT-METRICS 2)) "center" "center"
                     box))

(define yellow-light-pos
  (place-image/align yellow-light
                     (/ WIDTH 2) (- (- HEIGHT (/ LIGHT-METRICS 2)) (- LIGHT-METRICS 10)) "center" "center"
                     box)) 

(define red-light-pos
  (place-image/align red-light
                     (/ WIDTH 2) (- (- HEIGHT (/ LIGHT-METRICS 2)) (- (* 2 LIGHT-METRICS) 20)) "center" "center"
                     box))

(define (find-y color)
  (- (image-height box)(/ (image-height green-light) 2)))



(define (color-pos color)
  (cond [(string=? color "green") green-light-pos]
        [(string=? color "yellow") yellow-light-pos]
        [(string=? color "red") red-light-pos]))

(define (string-world string)
(big-bang string
  (check-with light-color?v1)
  (on-draw color-pos)
  (on-tick change-light 5)))
(string-world "green") 

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

;(slide-show basketball)

; change-light with image as model

(define (light-colorv2? thing)
  (or(image=? thing (circle 30 "solid" "green"))
     (image=? thing (circle 30 "solid" "yellow"))
     (image=? thing (circle 30 "solid" "red"))))

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

(define (show-lightv2 image)
  (cond [(image=? image green-light) green-light]
        [(image=? image yellow-light) yellow-light]
        [(image=? image red-light) red-light]))


  
(define (light-world image)
  (big-bang image
    (check-with light-colorv2?)
    (on-draw show-lightv2)
    (on-tick change-lightv2 5)))

;(light-world green-light)


; v3 number as a model

(define (light-color? thing)
  (or(= thing 1)
     (= thing 2)
     (= thing 3)))

; A light-color is any of the intergers 1, 2, or 3.
; change-light : light-color -> light-color
(check-expect (change-lightv3 1) 2)
(check-expect (change-lightv3 2) 3)
(check-expect (change-lightv3 3) 1)
(define (change-lightv3 number)
  ; color light-color
  (cond [(= number 1) 2]
        [(= number 2) 3]
        [(= number 3) 1]))

(check-expect (show-lightv3 1) (circle 30 "solid" "green"))
(check-expect (show-lightv3 2) (circle 30 "solid" "yellow"))
(check-expect (show-lightv3 3) (circle 30 "solid" "red"))
; show-lightv3 : light-color -> image
(check-expect green-light (circle 30 "solid" "green"))
(check-expect yellow-light (circle 30 "solid" "yellow"))
(check-expect red-light (circle 30 "solid" "red"))

(define (show-lightv3 number)
  (cond [(= number 1) green-light]
        [(= number 2) yellow-light]
        [(= number 3) red-light]))

(define (number-world number)
  (big-bang number
    (check-with light-color?)
    (on-draw show-lightv3)
    (on-tick change-lightv3 5)))

;(number-world 1)

; v4 number as a model with a mouse handler

(define (light-color?v4 thing)
  (or(= thing 1)
     (= thing 2)
     (= thing 3)))

; A light-color is any of the intergers 1, 2, or 3.
; change-light : light-color -> light-color
;(check-expect (change-lightv4 1) 2)
;(check-expect (change-lightv4 2) 3)
;(check-expect (change-lightv4 3) 1)
(define (change-lightv4 number x y me)
  ; color light-color
  (cond [(= number 1) 2]
        [(= number 2) 3]
        [(= number 3) 1]))

(check-expect (show-lightv4 1) (circle 30 "solid" "green"))
(check-expect (show-lightv4 2) (circle 30 "solid" "yellow"))
(check-expect (show-lightv4 3) (circle 30 "solid" "red"))
; show-lightv3 : light-color -> image
(define (show-lightv4 number)
  (cond [(= number 1) green-light]
        [(= number 2) yellow-light]
        [(= number 3) red-light]))

(define (number-worldv2 number)
  (big-bang number
    (check-with light-color?v4)
    (on-draw show-lightv4)
    ;(on-tick change-lightv3 5)
    (on-mouse change-lightv4)))

;(number-worldv2 1)



