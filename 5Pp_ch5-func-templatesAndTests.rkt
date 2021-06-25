(require picturing-programs)


; counterchange : image (top-left)
;                  image (top-right) -> image
; Produces a square arrangement with the top-left image also
; in the bottom right, and the top-right image also in the
; bottom left.

(check-expect (counterchange . .)
              (above (beside ..)
                     (beside . .)))

(check-expect (counterchange . . )
              (above (beside . .)
                     (beside . .)))

(define (counterchange top-left top-right)
  ;top-left   image        .

  ;top-right   image       .

  ;right answer image         (above (beside . .)
  ;                                   (beside . .))) 
  (above (beside top-left top-right)
         (beside top-right top-left)))

(counterchange . .)


; copies-beside : number image -> image
; Produces x copies of a pic beside each other where x equals number.

#|(check-expect(copies-beside 1 .)
"Should produce one copy of calendar beside another calendar."

(copies-beside 2 .)
"Should produce two copies of mad-hacker beside one another."

(copies-beside 3 .)
"Should produce three copies of bloch aside one another."

(copies-beside 0 .)
"Should produe zero copies of image and just print the original."

(define (copies-beside copies pic)
  ;copies number
  ;pic image
  ...)|#

; pinwheel : image -> image
; Produces a four square arrangment of images
; that are rotated clockwise rotation
; starting with the first top left image, then working
; in a clockwise rotation rotating images until
; it gets to the bottom left image

(define racket-ball  .)
(check-expect (pinwheel .)
              (beside
               (above racket-ball
                      (rotate-cw(rotate-180 racket-ball)))

               (above (rotate-cw racket-ball)
                      (rotate-180 racket-ball))))
"Should produce four images that rotate in a clockwise pattern
starting with the top right and second being the bottom right and
third being the bottom left"
(define hacker .)
(check-expect (pinwheel .)
              (beside
               (above hacker
                      (rotate-cw(rotate-180 hacker)))

               (above (rotate-cw hacker)
                      (rotate-180 hacker))))
"Should produce four images that rotate in a clockwise pattern
starting with the top right and second being the bottom right and
third being the bottom left"

(define (pinwheel pic)
  ; pic             image        .

       
  ; right answer    image (above .
  ;(rotate-cw(rotate-180 .)))

  ;     (above (rotate-cw .)
  ;        (rotate-180 .)))
  
  (beside
   (above pic
          (rotate-cw(rotate-180 pic)))

   (above (rotate-cw pic)
          (rotate-180 pic))))

(pinwheel .)

; checkerboard2 : string (top-left-color)
; string (top-right-color) -> image
; Assumes that both strings are color names.
; Produces a 2x2 checkerboard, with each small square 20
; pixels on a side, with the top-left color in the top-left
; and bottom-right positions, and the top-right color in
; the other two positions.

(check-expect(checkerboard2 "blue" "white")
             (counterchange
              (square 20 "solid" "blue")
              (square 20 "solid" "white")))
"Should produce a 2x2 pattern of blue and white squares,
where the top left color is blue and the bottom right is blue
and the top right color is in the other two positions"

(define (checkerboard2 square-color1 square-color2)
  ; square-color1 "solid" string
  ; square-color2 "solid" string
  ; 20 number
  ; right
  ; right answer (counterchange
  ;                (square 20 "solid" square-color1)
  ;                (square 20 "solid" square-color2)))

  (counterchange
   (square 20 "solid" square-color1)
   (square 20 "solid" square-color2)))

(checkerboard2 "blue" "white")

; bullseye : number(outer ring) string(outer ring color)
; number(inner ring) string(inner ring color) -> image
; Produces a image that places a inner ring inside
; an outer ring and the radii is the numbers given.

(check-expect (bullseye 10 "blue" 5 "red")
              (overlay (circle 5 "solid" "red")
                       (circle 10 "solid" "blue")))
"Should produce an outer circle with radius of 10 and color blue
with a inner circle overlayed with a radius of 5 and the color red"

(define (bullseye outer-radius outer-color inner-radius inner-color)
  ; outer-radius number
  ; outer-color string
  ; inner-radius number
  ; inner-color string
  ; "solid" string
  (overlay (circle inner-radius "solid" inner-color)
           (circle outer-radius "solid" outer-color)))

(bullseye 10 "blue" 5 "red")

; dot-grid : number(width) number(height) -> image
; produces a rectangle grid of circles
; that are placed above and beside
; each other depending on the height
; and width given in the function.

#|(dot-grid 10 15)
"Should produce a image with ten circle wide by fifteen circle high and the circle
have a radius of five. The image should be in the shape of a rectangle."  

(define (dot-grid width height)
  ; width a number
  ; height a number
  ; (circle 5 "solid" "blue") an image
  ...)|#

; lollipop : number(radius of head) number(length of stick) string(color of lollipop)-> image
; Produces a lollipop with a head of radius(number)
; and stick of length(number) and color(string).

(check-expect(lollipop 5 2 "red")
             (above (circle 5 "solid" "red")
                    (rectangle 2 10 "solid" "red")))
"Should be producing an image of a lollipop with a head with the radius of five
above a stick with the width of two and the color should be red"

(define (lollipop head-radius stick-width color)
  ; head-radius     number
  ; stick-length    number
  ; color           string
  ;        "solid" 
  ; right answer -> image    (above (circle 5 "solid" "red"
  ;                                  (rectangle 1 10 "solid" "red"))
  (above (circle head-radius "solid" color)
         (rectangle stick-width 10 "solid" color)))
(lollipop 5 2 "blue")

; diamond : string(color) number(side-length) -> image
; Produce a diamond that's a number in length on each side with a color

(check-expect (diamond 5 "solid" "red")
              (above
               (triangle 5 "solid" "red")
               (rotate-180(triangle 5 "solid" "red"))))

(define (diamond side-length mode color)
  ; side-length   number
  ; mode          string
  ; color         string
  ; right answer  -> image   (diamond 5 "solid" "red")
  ;            (above
  ;            (triangle 5 "solid" "red")
  ;           (rotate-180(triangle 5 "solid" "red"))))
  (above
   (triangle side-length mode color)
   (rotate-180(triangle side-length mode color))))

(diamond 20 "outline" "blue")

; text-box : string(text) string(color) number(width) number(height) -> image
; Produces a text-box with a text inside of a colored rectangle with a width and height

(check-expect (text-box "hello" "blue" 30 20)
              (overlay (text "hello" 18 "black")
                       (rectangle 30 20 "solid" "blue")))

(define (text-box word color width height)
  ; word    string
  ; color   string
  ; width   number
  ; height  number
  ; 18      number
  ; right answer -> image      (overlay (text "hello" 18 "black")
  ;                                     (rectangle 30 20 "solid" "blue"))
  (overlay (text word 18 "black")
           (rectangle width height "solid" color)))

(text-box "hello" "red" 40 30)

; two-eyes : number(radius) string(color) -> image
; Produces an image of two circles with a number(radius)100 pixels apart with
; and a black pupil that is a circle with a radius of 10. The measurement is
; edge to edge instead of center to center.

(check-expect (two-eyes 20 "red")
              (overlay/offset
               (overlay
                (circle 10 "solid" "black")
                (circle 20 "solid" "red"))
               -60 0
               (overlay
                (circle 10 "solid" "black")
                (circle 20 "solid" "red"))))

(define (two-eyes iris color)
  ; iris     number
  ; color    string
  ; right answer -> image                  (overlay/offset
  ;                                          (overlay
  ;                                           (circle 10 "solid" "black")
  ;                                           (circle 20 "solid" "red"))
  ;                                         -60 0
  ;                                          (overlay
  ;                                            (circle 10 "solid" "black")
  ;                                            (circle 20 "solid" "red"))))
  (overlay/offset
   (overlay
    (circle 10 "solid" "black")
    (circle iris "solid" color))
   -60 0
   (overlay
    (circle 10 "solid" "black")
    (circle iris "solid" color))))

(two-eyes 20 "white")

; circle-in-square : number(side-length) string(square color) string(circle color) -> image
; Produces a square of one color and a circle of the other inscribed in it. The diameter of the
; circle will touch the edges of the square.

(check-expect (circle-in-square 10 "yellow" "red")
              (overlay
               (circle 5 "solid" "red")
               (square 10 "solid" "yellow")))

(define (circle-in-square square-width square-color circle-color)
  ; square-width    number
  ; square-color    string
  ; circle-color    string
  ; right answer -> image                  (overlay
  ;                                          (circle 5 "solid" "red")
  ;                                          (square 10 "solid" "yellow")))
  (overlay
   (circle (/ square-width 2) "solid" circle-color)
   (square square-width "solid" square-color)))

(circle-in-square 23 "white" "red")

; caption-below : image string -> image
; Produces a copy of the same image with a string below the image

(check-expect (caption-below . "lambda" "white")
              (above
               .
               (text "lambda" 18 "white")))

(define (caption-below img caption caption-color)
  ; img    image
  ; text   string
  ; right answer    -> image    (caption-below . "lambda")
  ;                             (above
  ;                                .
  ;                                (text "lambda" 18 "white")))
  (above
   img
   (text caption 18 caption-color)))

(caption-below . "lambda" "green")
