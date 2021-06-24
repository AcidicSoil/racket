(require picturing-programs)
(require "ch10pix.rkt")
(require "ch.13.rkt")
(require "ch7.rkt")

; reply : string -> string

; reply:string("good morning","good afternoon",or "good night")->
; string ("I need coffee", "I need a nap", or "bedtime!")

"Examples of reply:"
(check-expect (reply "good morning") "I need coffee")
(check-expect (reply "good afternoon") "I need a nap")
(check-expect (reply "good night") "bedtime!")

(define (reply greeting)
  ; greeting a string
  (cond [(string=? greeting "good morning") "I need coffee"]
        [(string=? greeting "good afternoon") "I need a nap"]
        [(string=? greeting "good night") "bedtime!"]
        [else "huh?"];true can work in place of else [true "huh?"]
        ))

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

; random-bw-picture : number number -> Image

; random-bw-picture: number number(x y)
; a function that takes in a width and height and returns a
; rectangle with random black and white pixels on rectangle of that size

"Examples of random-bw-picture:"

(define white (color 255 255 255 255))
(define black (color 0 0 0 255))

(define (black-or-white x y)
  (cond [(= (random 2) 0) black]
        [else white]))

(define (random-bw-picture width height)
  (build-image width height black-or-white))
;

(define (same-votes? vote1 vote2)
  (or (string=? vote1 vote2)
      (string=? vote1 vote2)))

(define (vote-check vote1 vote2)
  (cond [(same-votes? vote1 vote2) "1"]
        [else "0"]))

(define (count-votes-4 canidate vote1 vote2 vote3 vote4)
  (cond[(same-votes? canidate vote4) (+ (string->number (vote-check canidate vote4)) (string->number(vote-check canidate vote1)) (string->number (vote-check canidate vote2)) (string->number (vote-check canidate vote3)))]
       [(same-votes? canidate vote3) (+ (string->number (vote-check canidate vote3)) (string->number(vote-check canidate vote1)) (string->number (vote-check canidate vote2)))]
       [(same-votes? canidate vote2) (+ (string->number (vote-check canidate vote2)) (string->number(vote-check canidate vote1)))]
       [(same-votes? canidate vote1) (string->number (vote-check canidate vote1))]
       [else 0]))

(define (smallest-of-3 num1 num2 num3)
  (cond [(<= num1 num2 num3) num1]
        [(<= num3 num1 num2) num3]
        [else num2]))

(define (child? age)
  (< age 13))

(define (rough-age age)
  (cond [(teenage? age) "teenager"]
        [(child? age) "child"]
        [else "adult"]))
;;;

; if x is y place a blue pixel
; if x = y place a black pixel
; if x is < y place a yellow pixel

(define WIDTH 150)
(define HEIGHT 100)
(define IMAGE-MATH
  (/ WIDTH HEIGHT)) 

(define (blue-diag x y)
  (cond [(<  x (* IMAGE-MATH y)) 255]
        [else 0]))

(define (yellow-diag x y)
  (cond [(> x (* IMAGE-MATH y)) 255]
        [else 0 ]))

;(build-image 150 100 yellow-diag)
"diag picture"
(build3-image 150 100 yellow-diag yellow-diag blue-diag)

; make-stripes : number number -> Image

; Takes in a width and height to create a shape
; with even and odd numbered stripes

(define (red-stripe x y)
  (cond [(= (modulo (* y y) 2) 0) 255]
        [else 0]))

(define (blue-stripe x y)
  (cond[(= (modulo (* y y) 2) 1) 255]
       [else 0]))

(define (make-stripes width height)
  (build3-image width height red-stripe always-zero blue-stripe))

;(build3-image 150 100 red-stripe always-zero blue-stripe)

; another version
(define (red-even x y)
  (cond [(even? (quotient y 5)) 255] 
        [else 0]))

(define (blue-odd x y)
  (cond[(odd? (quotient y 5)) 255]
       [else 0])) 

;(build3-image 150 100 red-even always-zero blue-odd)

; 
(define red (color 255 0 0 255))
(define blue (color 0 0 255 255))

(define (blue-or-red x y)
  (cond [(odd? (quotient y 5)) red]
        [else blue]))

;(build-image 150 100 blue-or-red)

; make-diag-stripes-test
(define (make-diag-stripes-fun x y)
  (cond[(even? (quotient (- y y x y) 5) ) red]
       [else blue]))

(define (make-diag-stripes width height)
  (build-image width height make-diag-stripes-fun))
(build-image 150 100 make-diag-stripes-fun)

; simplify-colors

(define green (color 0 255 0 255))

(define (zero-blue-pixels x y red green blue)
  0)

(define (zero-red-pixels x y red green blue)
  0)

(define (zero-green-pixels x y red green blue)
  0)
;
(define (keep-red-pixels x y red green blue)
  (cond [(> red green blue) red]
        [(> green red blue) green]
        [(> blue red green) blue]
        [else 255]))

(define (keep-green-pixels x y red green blue)
  green)

(define (keep-blue-pixels x y red green blue)
  blue)

(define (make-white-pixels x y red green blue)
  255)
; 
(define (keep-red image)
  (map3-image keep-red-pixels keep-red-pixels keep-red-pixels image))

(define (keep-blue image)
  (map3-image zero-red-pixels zero-green-pixels keep-blue-pixels image))

(define (keep-green image)
  (map3-image zero-red-pixels keep-green-pixels zero-blue-pixels image))

(define (make-white image)
  (map3-image make-white-pixels make-white-pixels make-white-pixels image))
;

(define (count-green-pixels image)
  ...)
(define (count-blue-pixels image)
  ...)

; lose-red : color -> color
(define (lose-red old-color)
  (make-color 0 (color-green old-color) (color-blue old-color)))

(define (lose-green old-color)
  (make-color (color-red old-color) 0 (color-blue old-color)))

(define (lose-blue old-color)
  (make-color (color-red old-color) (color-green old-color) 0))
 
(map-image lose-red .)


#|(define (make-diag-stripes-fun x y)
  (cond[(even? (quotient (- y y x y) 5) ) red]
       [else blue]))|#


(define (simplify-colors image)
  (cond [(color? red) red]
        [(color? blue red green) blue] 
        [(color? green red blue) green]
        [else white]))

;(map3-image red-function green-function blue-function image)

;; get-pixel : Image Number Number -> Color
(define (get-pixel img x y)
   (list-ref (image->color-list img)
             (+ x (* (image-width img) y))))
