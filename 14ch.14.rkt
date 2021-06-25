;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch.14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
;(require "ch10.rkt")

; show-string : string -> image
(check-expect (show-string "") (text "" 18 "blue"))
(check-expect (show-string "hello") (text "hello" 18 "blue"))
(define (show-string model)
  ; model a string
  (text model 18 "blue"))

(define (chop-string model)
  ; model a string
  (substring model 1))

#|; empty-string? : string -> boolean
(check-expect (empty-string? "") true)
(check-expect (empty-string? "m") false)
(check-expect (empty-string? "n") false)
(check-expect (empty-string? "hello") false)
(define (empty-string? model)
; model a string
; "" a fixed string
(string=? model ""))|#

; stop-three-or-less?
(check-expect (stop-three-or-less? "") true)
(check-expect (stop-three-or-less? "hel") true)
(check-expect (stop-three-or-less? "he") true)
(check-expect (stop-three-or-less? "hell") false)
(define (stop-three-or-less? model)
  (or (<= (string-length model) 3)
      (= (string-length model) 3)))

;(big-bang "home"
#|(big-bang "antidisestablishmentarianism"
  (check-with string?)
  (on-draw show-string)
  (on-tick chop-string 1/2)
  ;(stop-when empty-string?)
  (stop-when stop-three-or-less?))|#

; animation from 10.2.1
; appends "b" to "a" until it reaches 10 chars
(define (add-str s)
  (string-append  s "b"))

(define (a-with-b s)
  (text s 18 "green"))

(define (chop-first-on-mouse s mouse-x mouse-y me)
  (substring s (min 1 (string-length s))))

(check-expect (ten-chars? "abbbbbbbbb") true)
(check-expect (ten-chars? "abbbbbbbb") false)
(check-expect (ten-chars? "bbbbbbbbbbb") true)
(check-expect (ten-chars? "bbbbbbbbb") false)
(define (ten-chars? s)
  (or (> (string-length s) 10)
      (>= (string-length s) 10)))

#|(define (string-world s)
  (big-bang s
    (check-with string?)
    (on-tick add-str 1/2)
    (on-draw a-with-b 200 200)
    (on-mouse chop-first-on-mouse)
    (stop-when ten-chars?)))|#
;(string-world "a")

; move-right-10 : image -> image
(define END-POINT (+ (image-width (beside (rectangle 10 0 "solid" "white") pic:calendar)
                                  ) 500))
     
;(define (move-right-10 picture)
; picture image
;  (beside (rectangle 10 0 "solid" "white") picture)
;  )

(define (out-of-site-right? picture)
  (or (>=  (image-width picture) END-POINT)
      (>=  (image-width picture) END-POINT)))
 
#|(big-bang pic:calendar
  (on-draw show-it 500 500)
  (on-tick move-right-10 )
  (stop-when out-of-site-right?))|#

; modified move-left-3
; move-left-3 : image -> image

(define START-POINT  (image-width (place-image pic:calendar 
                                               32 31
                                               (rectangle 100 62 "solid" "white"))) )

(define (move-left-3 picture)
  ; picture image
  (place-image picture
               32 31(overlay/offset
   
                     (rectangle 100 62 "solid" "white") 
                     -1 0
                     picture)))

(define (out-of-site-left? picture)
  (image=? (place-image picture
                        32 31(overlay/offset
   
                              (rectangle 100 62 "solid" "white") 
                              -1 0
                              picture)) picture))
      

#|(big-bang pic:calendar
  (on-draw show-it 500 100)
  (on-tick move-left-3 1/2)
  (stop-when out-of-site-left?))|#

; double-dots : image -> image
; doubles dots every two seconds



(check-expect (double-dots (circle 2 "solid" "red"))
              (beside (circle 2 "solid" "red")
                      (circle 2 "solid" "red")))

(check-expect (place-in-center pic:calendar)
              (place-image/align pic:calendar
                                 250 50 "center" "center"
                                 (rectangle 500 100 "solid" "white")))

(define (place-in-center picture)
  (place-image/align picture
                     250 50 "center" "center"
                     (rectangle 500 100 "solid" "white")))

(define (double-dots dot)
  (beside dot
          dot))

(define (hits-edge dot)
  (>= (image-width (double-dots dot)) 300))

#|(big-bang (circle 2 "solid" "red")
  (on-draw show-it 100 100)
  (on-tick double-dots 1/2)
  (stop-when hits-edge))|#

;Exercise 14.1.7 
(define END-POINT-X (+ (image-width (beside (rectangle 10 0 "solid" "white") pic:calendar)
                                    ) 418))

(define END-POINT-Y (+ (image-height (above
                                      (rectangle 0 5 "solid" "white") pic:calendar)) 418))

(define (move-right-10 picture)
  ; picture image
  (beside (rectangle 10 0 "solid" "white") picture)
  )

(define (move-down-5 picture)
  ; picture          image
  (above
   (rectangle 0 5 "solid" "white") picture))

(define (some-image picture)
  (place-image picture
               10 10
               (rectangle 200 200 "solid" "white")))

(define (down-on-key picture key)
  (above
   (rectangle 0 5 "solid" "white") picture))

(define (hits-edge? picture)
  (or (>=  (image-width picture) END-POINT-X)
      (>=  (image-height picture) END-POINT-Y)))

#|(big-bang pic:calendar
  (on-draw some-image)
  (on-tick move-right-10 )
  (on-key down-on-key)
  (stop-when hits-edge?))|#

; blue-circle-of-size : number(radius) -> image

(define TOP-OF-WINDOW 100)
(define WINDOW-SIDE-LENGTH 300)

(define (blue-circle-of-size radius)
  ; radius number
  ; "blue" a string I know I’ll need
  (place-image/align (circle radius "solid" "blue")
                     (/ WINDOW-SIDE-LENGTH 2) (/ TOP-OF-WINDOW 2) "center" "center"
                     (rectangle WINDOW-SIDE-LENGTH TOP-OF-WINDOW "solid" "white")))



(define (hits-side? radius)
  (or (>= radius   (/ WINDOW-SIDE-LENGTH 2))
      (>= radius (/ TOP-OF-WINDOW 2))))

#|(big-bang  7
  (check-with number?)
  (on-draw blue-circle-of-size)
  (on-tick add1 1/10)
  (stop-when hits-side?))|#

(define IMAGE-CENTER-TO-TOP (- TOP-OF-WINDOW (/ (image-height (circle 5 "solid" "blue")) 2)))

(define (sub5 y)
  (+ y 5))

(define (some-picture-y y)
  (place-image (circle 5 "solid" "blue")
               10 (sub5 y) 
               (rectangle WINDOW-SIDE-LENGTH TOP-OF-WINDOW "solid" "white")))

(define (hits-bottom? y)
  (> y IMAGE-CENTER-TO-TOP))

;(- HEIGHT (/ (image-height ROCKET) 2))

#|(big-bang  7
  (check-with number?)
  (on-draw some-picture-y)
  (on-tick sub5 1/2)
  (stop-when hits-bottom?))|#

; dot that doubles every 5 seconds and shrinks 4 pixels when a key is pressed

(define (dot-double radius)
  (* 2 radius))

(define (dotshrink-on-key radius key)
  (- radius 4))

(define (special-dot radius)
  (place-image/align (circle radius "solid" "blue")
                     100 100 "center" "center"
                     (rectangle 200 200 "solid" "white")))

(define (less-than-zero? radius)
  (< radius 0))

#|(big-bang 5
  (check-with number?)
  (on-draw special-dot 200 200)
  (on-tick dot-double 5)
  (on-key dotshrink-on-key)
  (stop-when less-than-zero?))|#

; progress-bar : number(progress) -> Image
; produces a bar image based on the number given

(define BAR-END 120)
(define (progress-bar progress-bar-percentage)
  ; bar-width number
  ; bar-height number
  ; progress-bar-percentage number
  ; bar-color string
  (overlay/align "left" "middle"
                 (rectangle  progress-bar-percentage 20 "solid" "blue")
                 (rectangle BAR-END 20 "outline" "blue")))

(define (reach-100? progress-bar-percentage)
  (> progress-bar-percentage BAR-END))

#|(big-bang 5
  (check-with number?)
  (on-draw progress-bar)
  (on-tick add1 )
  (stop-when reach-100?))|#

; Digital clock

(define (number->image num)
  (text (number->string num) 18 "blue"))

(define (show-number num)
  (number->image num))

(define (reaches-30? num)
  (> num 30))

#|(big-bang 0
  (check-with number?)
  (on-tick add1 )
  (on-draw show-number 200 200)
  (stop-when reaches-30?))|#

; Moving digital clock

(define blank-screen
  (rectangle 200 200 "solid" "white"))


(define (num-mover num)
  (+ num 1))

(define (move-x-coord num)
  (place-image (number->image num)
               (num-mover num) 100
               blank-screen))

(check-expect (stop-on-key 24 "whatever")

              (stop-with 24))

(define (stop-on-key num key)
  ; model number
  ; key whatever this is (ignore)
  (stop-with num))

#|(big-bang 1
  (check-with number?)
  (on-tick add1 1)
  (on-draw move-x-coord)
  (on-key stop-on-key))|#

; animation that displays the word "cat"

(define (first-half s)
  (substring s 0 (floor(/ (string-length s) 2))))

(define (last-half s)
  (substring s (floor(/ (string-length s) 2)) (string-length s)))

(define (insert-in-middle s)
  (string-append (first-half s) "xyz" (last-half s)))

(define (cat-function s)
  (text s 18 "green"))

(define (stop-on-key? s key)
  (stop-with s)) 

#|(big-bang "cat"
  (check-with string?)
  (on-tick insert-in-middle 1)
  (on-draw cat-function 200 200)
  (on-key stop-on-key?)
  )|#

; stop on mouse click
(define (move-right-10.2 model)
  ; picture image
  (beside (rectangle 10 0 "solid" "white") model)
  )

(define (click? model x y me)
  (stop-with model))

(big-bang pic:calendar
  (on-draw show-it 500 100)
  (on-tick move-right-10.2 1)
  (on-mouse click?))
