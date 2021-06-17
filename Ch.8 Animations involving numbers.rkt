;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ch.8 Animations involving numbers|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; blue-circle-of-size : number(radius) -> image
(check-expect (blue-circle-of-size 2)
              (place-image/align (circle 2 "solid" "blue")
                                 100 100 "center" "center"
                                 (rectangle 200 200 "solid" "white")))
(check-expect (blue-circle-of-size 37)
              (place-image/align (circle 37 "solid" "blue")
                                 100 100 "center" "center"
                                 (rectangle 200 200 "solid" "white")))

(define (blue-circle-of-size radius)
  ; radius number
  ; "blue" a string I know I’ll need
  (place-image/align (circle radius "solid" "blue")
                     100 100 "center" "center"
                     (rectangle 200 200 "solid" "white")))

(big-bang 7
(check-with number?)
(on-draw blue-circle-of-size 100 50))

; x-coordinate : image -> number
(define (x-coordinate x)
  (place-image
   (circle 20 "solid" "darkorange")
   x 50
   (rectangle 200 200 "solid" "white")))

(big-bang 5
  (check-with number?)
  (on-draw x-coordinate)
  (on-tick add1 1/10))

(big-bang  7
  (check-with number?)
  (on-draw blue-circle-of-size 200 200)
  (on-tick add1 1/10))

(define (growing-square side-length)
  (place-image/align
   (square side-length "solid" "orange")
   100 100 "center" "center"
   (rectangle 200 200 "solid" "white")))

(big-bang 1
  (check-with number?)
  (on-draw growing-square 200 200)
  (on-tick add1 1))

(define (growing-2x1-rectangle height)
  (place-image/align
   (rectangle (sub1 height) height "solid" "purple")
   100 100 "center" "center"
   (rectangle 200 200 "solid" "white")))

(define (add2-height height)
  (+ 2 height))
(define (add1-width width)
  (add1 width))

(big-bang 2
  (check-with number?)
  (on-draw growing-2x1-rectangle 200 200)
  (on-tick add1 1))

(define XCENTER 100)
(define YCENTER 100)
(define XSCALE 50)
(define YSCALE 30)
(define (SUM-EXPRESSION t)
  (* 100(/ t 10)))

(define (x-coord t)
  (+ XCENTER (* XSCALE (cos (SUM-EXPRESSION t)))))

(define (y-coord t)
  (+ YCENTER (* YSCALE (sin (SUM-EXPRESSION t)))))

(define (random-star t)
  (place-image
   (star 10 "solid" "black")
   (x-coord t) (y-coord t)
   (rectangle 200 200 "solid" "white")))

(big-bang 5
  (check-with number?)
  (on-draw random-star 200 200)
  (on-tick add1))

; progress-bar : number(progress) -> Image
; produces a bar image based on the number given


(define (progress-bar progress-bar-percentage)
  ; bar-width number
  ; bar-height number
  ; progress-bar-percentage number
  ; bar-color string
  (overlay/align "left" "middle"
                 (rectangle  progress-bar-percentage 20 "solid" "blue")
                 (rectangle 120 20 "outline" "blue")))


(big-bang 5
  (check-with number?)
  (on-draw progress-bar)
  (on-tick add1 1/4))

; mouse handlers w / draw 

(define (calendar-at-x x)
  (place-image
   pic:calendar
   x 50
   (rectangle 200 200 "solid" "white")))

"Examples of add1-on-mouse:"
(check-expect
 (add1-on-mouse 3 29 348 "blarg") 4)
(check-expect
 (add1-on-mouse 15 503 6 "glink") 16)

(define (add1-on-mouse x mouse-x mouse-y event)
  ; x number
  ; mouse-x number (ignore)
  ; mouse-y number (ignore)
  ; event whatever (ignore)
  (+ x 1) ; or, if you prefer, (add1 x)
  )

; sub4-on-key : number (x) key -> number
(check-expect (sub4-on-key 7 "dummy argument") 3)
(check-expect (sub4-on-key 4 "whatever") 0)
(define (sub4-on-key x key)
  ; x number
  ; key whatever (ignore)
  (- x 4)
  )

(big-bang 250
  (check-with number?)
  (on-draw calendar-at-x 500 100)
  (on-mouse add1-on-mouse)
  (on-key sub4-on-key))
  
(define (sub5 y)
  (+ y 5))

(define (some-picture-y y)
  (place-image (circle 5 "solid" "blue")
               10 (sub5 y) 
               (rectangle 200 200 "solid" "white")))

(big-bang  7
  (check-with number?)
  (on-draw some-picture-y 200 200)
  (on-tick sub5 1/2))

; dot that doubles every 5 seconds and shrinks 4 pixels when a key is pressed

(define (dot-double radius)
  (* 2 radius))

(define (dotshrink-on-key radius key)
  (abs(- radius 4)))

(define (special-dot radius)
  (place-image/align (circle radius "solid" "blue")
                     100 100 "center" "center"
                     (rectangle 200 200 "solid" "white")))

(big-bang 5
  (check-with number?)
  (on-draw special-dot 200 200)
  (on-tick dot-double 5)
  (on-key dotshrink-on-key))

(define (switch x)
  (- 80 x))

(define (moving-disk x)
  (overlay/xy (circle 15 "solid" "red")
              x 0
              (beside (circle 20 "solid" "blue") (circle 20 "solid" "green"))))

(big-bang 20
  (check-with number?)
  (on-draw moving-disk)
  (on-tick switch 1))

; progress-bar : number(progress) -> Image
; produces a bar image based on the number given

; Decreasing progress bar

(define (halved x)
  (/ x 2))

(define (progress-bar x)
  ; bar-width number
  ; bar-height number
  ; progress-bar-percentage number
  ; bar-color string
  (overlay/align "left" "middle"
                 (rectangle x 20 "solid" "blue")
                 (rectangle 120 20 "outline" "blue")))

(big-bang 120
  (check-with number?)
  (on-draw progress-bar)
  (on-tick halved 1))

; Random x-coordinate picture

(define (x-num x)
  (+ (* 20 (random 5)) 20))

(define (moving-picture x)
    (place-image (circle 15 "solid" "red")
                x 100
              (rectangle 200 200 "solid" "black")))

(big-bang (random 5)
  (check-with number?)
  (on-draw moving-picture)
  (on-tick x-num 1))

(define (one-pixel x)
  (- (expt (random 3) 1)(* x 1)))

(define (left-or-right x)
      (place-image (circle 15 "solid" "red")
                (+ 50 x) 100
              (rectangle 200 200 "solid" "black")))

(big-bang (random 3)
  (check-with number?)
  (on-draw left-or-right)
  (on-tick one-pixel 1/4))

; Random dots
(define DOT
  (circle 4 "solid" "black"))

(define blank-screen
  (rectangle 200 200 "solid" "white"))
 
(define (next-dot x)
  (overlay/xy  x
                (random 200)  (random 200))
               (old-dot DOT)))

(define (old-dot x)
  (overlay/align "center" "center"
   (overlay/xy x
                (random 200) (random 200)
            (circle 50 "solid" "white"))
            blank-screen))
  
(big-bang DOT
  (on-tick next-dot 1/2)
  (on-draw old-dot 200 200))

; Random dots
(define DOT
  (circle 4 "solid" "black"))

(define blank-screen
  (rectangle 200 200 "solid" "white"))
 
(define (next-dot x)
  (overlay/xy  x
                (random 200) (random 200)
               DOT))

(define (old-dot x)
  (overlay/xy x
              (random 200)  (random 200)
              blank-screen))

(big-bang DOT
  (on-tick next-dot 1/2)
  (on-draw old-dot 200 200))