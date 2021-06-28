;; Example for UMM CSci 1301

;; mouse clicks world

;; the world displays the position of a mouse click on the canvas

;; the world state is the position of the last click

;; TO-DO: display empty canvas before the first click
;; (without changing the world state)
(require picturing-programs)
(provide (all-defined-out))
; constants
(define width 200)
(define height 200)
(define half-w (/ width 2))
(define half-h (/ height 2))
(define font-size (/ height 4))
(define blank (empty-scene width height))
(define no-click-posn (make-posn -1 -1))
(define dot
  (circle 10 "solid" "black"))
(define red-dot
  (circle 10 "solid" "red"))
(define green-dot
  (circle 10 "solid" "green"))

(define (main duration)
  (big-bang no-click-posn
    [to-draw show] 
    [on-tick do-nothing 1 duration] 
    [on-mouse record-click]
    )) 

;; do-nothing: world state -> world state
;; takes the state of the world and returns it unchanged,
;; for world programs that don't change the world on clock ticks
(define (do-nothing ws) 
  ws)

;; helper function for show: 

;; posn->image: posn -> image
;; consumes a position and returns an image displaying
;; its coordinates
(define (posn->image a-posn)
  (cond [(> (posn-x a-posn)(posn-y a-posn)) (place-image red-dot
               (posn-x a-posn) 
               (posn-y a-posn)
  blank)]
        [else (place-image green-dot
               (posn-x a-posn) 
               (posn-y a-posn)
  blank)]))


;(define (posn->image a-posn)
;  (cond [(> (posn-x a-posn)(posn-y a-posn)) (circle 5 "solid" "red")]
;        [else (circle 5 "solid" "green")]))

;; show: posn -> image
;; consumes a posn structure and returns a scene with a 
;; a dot at that position
(define (show ws)
  (place-image (posn->image ws)
               half-w
               half-h
               blank))

;; record-click: posn, number, number, click-type -> posn
;; consumes the current state of the world (a position),
;; the coordinates of a mouse event, and the type of the
;; mouse event. If the event is "button-up" (end of a click)
;; then the position of the click is returned, otherwise
;; the old state is returned
(define (record-click ws x y type)
  (cond
    [(mouse=? type "button-up") (make-posn x y)]
    [else ws]))

(main 100)



