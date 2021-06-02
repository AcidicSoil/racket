(require picturing-programs)

#|(define (mirror-image picture)
  (beside picture (flip-horizontal picture)))

(define (vert-mirror-image picture)
  (above picture
         (flip-vertical  picture)))

; big-bang : image(start) event-handler ... -> image

(big-bang (overlay
           (circle 20 "solid" "green")
           (square 100 "solid" "white")) (on-draw show-it))

(big-bang (overlay/align
           "center" "center"
           pic:calendar (rectangle 100 100 "solid" "white"))
  (on-draw show-it)
  (on-tick flip-vertical 1.5))

(big-bang (overlay pic:calendar (rectangle 200 200 "solid" "white"))
  (on-draw show-it)
  (on-tick rotate-cw 1/2))

; move-right-10 : image -> image
(check-expect (move-right-10 pic:calendar)
              (beside (rectangle 10 0 "solid" "white") pic:calendar))
(check-expect (move-right-10 (circle 3 "solid" "green"))
              (beside (rectangle 10 0 "solid" "white")
                      (circle 3 "solid" "green")))

(define (move-right-10 picture)
  ; picture image
  (beside (rectangle 10 0 "solid" "white") picture)
  )

(big-bang pic:calendar
  (on-draw show-it 500 100)
  (on-tick move-right-10 1))

; move-down-5 : image -> image
(check-expect (move-down-5 pic:calendar)
              (above
               (rectangle 0 5 "solid" "white") pic:calendar))

(define (move-down-5 picture)
  ; picture          image
  (above
   (rectangle 0 5 "solid" "white") picture))
(big-bang pic:calendar
  (on-draw show-it 500 100)
  (on-tick move-down-5 1/2))

; move-left-3 : image -> image
(check-expect (move-left-3 pic:calendar)
              (place-image pic:calendar 
                           32 31
                           (rectangle 100 62 "solid" "white")))

(define (move-left-3 picture)
  ; picture image
  (place-image picture 
               32 31
               (rectangle 100 62 "solid" "white")))

(big-bang pic:calendar
  (on-draw show-it 500 100)
  (on-tick move-left-3 1/2))

; double-dots : image -> image
; doubles dots every two seconds


(big-bang (circle 2 "solid" "red")
  (on-draw show-it 500 100)
  (on-tick double-dots 3))

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

(big-bang (circle 2 "solid" "red")
  (on-draw place-in-center)
  (on-tick double-dots 3))

; place-on-pink : image -> image

(check-expect (place-on-pink pic:calendar)
              (place-image pic:calendar
                           100 40
                           (rectangle 150 200 "solid" "pink")))
(check-expect (place-on-pink (triangle 30 "solid" "blue"))
              (place-image (triangle 30 "solid" "blue")
                           100 40
                           (rectangle 150 200 "solid" "pink")))

(define (place-on-pink picture)
  ; picture image
  (place-image picture
               100 40
               (rectangle 150 200 "solid" "pink"))
  )

(big-bang pic:calendar
  (on-tick rotate-cw 1/2)
  (on-draw place-on-pink))

(define pix-art .)


(define (smooth-rotate picture)
  (rotate -5 picture))

(define (place-on-center picture)
  ; picture image
  (overlay
   (overlay   picture
              (circle 45 "solid" "pink"))
   (rectangle 150 200 "solid" "pink")))

  
  
(big-bang pix-art
  (on-tick smooth-rotate .1)
  (on-draw place-on-center))



(define (rot pic1)
  (rotate 5 pic1))

(define (lake img)
  (place-images (list img
                      (flip-vertical img))
                (list (make-posn 470 470)
                      (make-posn 470 430))
                (square 500 "solid" "green")))


  
  
(big-bang .
  (on-draw lake)
  (on-tick rot 1))

(define (background img)
  (place-images (list img
                      (flip-vertical img)
                      (rotate-ccw img))
                (list (make-posn 470 470)
                      (make-posn 470 430)
                      (make-posn 440 300))
                (square 500 "solid" "green")))

(big-bang .
  (on-draw background)
  (on-tick rot 1))

(define (rot2 pic1)
  (rotate -5 pic1))

(define (background img)
  (place-images (list  img
                      (rotate-cw(rotate-180 img))
                      (rotate-cw(flip-vertical img)))
                (list (make-posn 200 250)
                      (make-posn 470 430)
                      (make-posn 440 300))
                (square 500 "solid" "green")))

(big-bang .
  (on-draw background)
  (on-tick rot2 1))

(check-expect
(move-right-10-on-mouse pic:calendar 318 27 "whatever")
(beside (rectangle 10 0 "solid" "white") pic:calendar))
(check-expect
(move-right-10-on-mouse (circle 3 "solid" "green") -3784 3.7 "blah")
(beside (rectangle 10 0 "solid" "white")
(circle 3 "solid" "green")))


(define (move-right-10-on-mouse picture x y mouse-event)
; picture image
; x number
; y number
; mouse-event whatever this is
(beside (rectangle 10 0 "solid" "white") picture)
)

(big-bang pic:calendar
(on-draw show-it 500 100)
(on-mouse move-right-10-on-mouse))

; calendar-at-mouse : image(old-picture)
; num(x) num(y) mouse-event -> image

; Produces a picture of a calendar, with its top-left corner
; x pixels from the left and y pixels down from the top.
; Assumes x and y are both positive integers.

(define white-background (rectangle 500 300 "solid" "white"))

(check-expect
(calendar-at-mouse pic:stick-figure 34 26 "huh?")
(place-image pic:calendar 34 26 white-background))

; whatever other examples you’ve come up with
(check-expect (calendar-at-mouse pic:bloch 40 40 "huh")
              (place-image pic:calendar 40 40 white-background))

(define (calendar-at-mouse old-picture x y mouse-event)
; old-picture image (ignored)
; x positive integer
; y positive integer
; mouse-event whatever this is (ignored)
(place-image pic:calendar x y white-background)
)

(big-bang white-background
(on-draw show-it)
(on-mouse calendar-at-mouse))

(big-bang (rectangle 0 0 "solid" "white")
(on-draw show-it 500 300)
(on-mouse calendar-at-mouse))

; whatever other examples you’ve come up with
(check-expect (calendar-at-mouse-x pic:bloch 40 150 "huh")
              (place-image pic:calendar 40 150 white-background))

(define (calendar-at-mouse-x old-picture x y mouse-event)
; old-picture image (ignored)
; x positive integer
; y positive integer
; mouse-event whatever this is (ignored)
(place-image pic:calendar x 150 white-background)
)

(big-bang white-background
(on-draw show-it)
(on-mouse calendar-at-mouse-x))

(big-bang (rectangle 0 0 "solid" "white")
(on-draw show-it 500 300)
(on-mouse calendar-at-mouse-x)
  (record? true))

;comeback and finish after ch 18
(define (decrease-5 picture  )
  ; picture          image
  (above
   (rectangle 0 5 "solid" "white") picture))

(big-bang (rectangle 0 0 "solid" "white")
  (on-draw show-it 500 300)
  (on-tick move-right-10 1)
  (on-key decrease-5 ))|#
