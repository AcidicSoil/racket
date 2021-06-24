(require picturing-programs)
(require "Fixed-size-data.rkt")
(require "ch7.rkt")
(provide (all-defined-out))

;(string=? "DOG" "dog")
;(string=? "DOG" "cat")
;(string<? "!" ".")
;(string<? "." "@")

;"Examples of is-basketball?:"
(check-expect (is-basketball? "basketball") true)
(check-expect (is-basketball? "cricket") false)

(define (is-basketball? game)
  ; game a string
  ; "basketball" another string
  (string=? game "basketball")
  )

(define (is-nintendo? game)
  ; game is a string
  ; "nintendo" another string
  (string=? game "nintendo"))

(define (empty-string? empty-string)
  ; empty-string is a string
  ; "" another string
  (string=? empty-string ""))

(define (first-half? in-first-half)
  ; first-half is a string
  ; "a" another string
  ; "n" another string
  (string<=? in-first-half "n"))

#|(check-expect (= 3 4) false)
(check-expect (< 3 4) true)
(check-expect (> 3 4) false)
(check-expect (<= 3 4) true)
(check-expect (>= 3 4) false)
(define age 21)
(check-expect (> age 12) true)
(check-expect (< age 18) false)
(check-expect (= (+ 3 4) 5) false)
(check-expect (= (+ 3 4) 7) true)|#

(define (may-drive? age)
  ; age a number
  ; 16 a fixed number we’re likely to need
  ( >= age 16)
  )

(define (may-drink? age)
  ; age a number
  ; 21 a fixed number
  ( >= age 21))

(define (under-a-dollar price)
  ; dollar a number
  ; 1.00 is a fixed number
  ( <= price 1.00 ))


(define (is-17? num)
  ; num a number
  ; 17 a fixed number
  ( = num 17 ))

(check-expect (much-older? 10 0) true)
(check-expect (much-older? 20 11) false)
(define (much-older? age1 age2)
  ; age1 a number
  ; age2 a number
  ; age 1 must be + 10 years older than age2
  ( >=  (- age1 age2) 10))

(check-expect (within-distance? 0 0 0) true)
(check-expect (within-distance? 1 1 3) true)
(check-expect (within-distance? 5 5 7) false)
(define (within-distance? x y distance)
  ( <= (distance-to-origin x y) distance))


(check-expect (is-green-triangle? (triangle 11 "solid" "green") ) false)
(check-expect (is-green-triangle? (triangle 10 "solid" "green") ) true)
(define (is-green-triangle? image)
  ( image=? (triangle 10 "solid" "green") image))

; number? : anything -> boolean
; tells whether its argument is a number.
; image? : anything -> boolean
; tells whether its argument is an image.
; string? : anything -> boolean
; tells whether its argument is a string.
; boolean? : anything -> boolean
; tells whether its argument is a boolean.
; integer? : anything -> boolean
; tells whether its argument is an integer.

; 18-to-25? : number (age) -> Boolean

;"Examples of 18-to-25?:"
(check-expect (18-to-25? 15) false)
(check-expect (18-to-25? 18) true)
(check-expect (18-to-25? 20) true)
(check-expect (18-to-25? 25) true)
(check-expect (18-to-25? 27) false)

(define (18-to-25? age)
  ; age a number
  ; 18 a fixed number we’ll need
  ; 25 another fixed number we’ll need
  ; (>= age 18) a Boolean
  ; (<= age 25) a Boolean
  (and (>= age 18)
       (<= age 25))
  )

(check-expect (teenage? 12) false)
(check-expect (teenage? 21) false)
(check-expect (teenage? 20) true)
(check-expect (teenage? 13) true)
(define (teenage? age)
  ; age a number
  ; 13 a fixed number we'll need
  ; 20 a fixed number we'll need
  ; (>= age 13) a boolean
  ; (<= age 20) a boolean
  (and (>= age 13)
       (<= age 20)))


(check-expect (negative-or-over-100? 1) false)
(check-expect (negative-or-over-100? -1) true)
(check-expect (negative-or-over-100? 101) true)
(check-expect (negative-or-over-100? 100) false)
(define (negative-or-over-100? num)
  ; num a number
  ; -1 a fixed number we'll need
  ; 100 another fixed number we'll need
  ; (< num 0) a boolean
  ; (>= num 101) a boolean
  (or (< num 0)
       (>= num 101)))

(define (16-20? age)
  ; age a number
  ; 16 a fixed number we’ll need
  ; 20 another fixed number we’ll need
  ; (>= age 16) a Boolean
  ; (<= age 20) a Boolean
  (and (>= age 16)
       (<= age 20))
  )

(check-expect (may-drive-but-not-drink? 15) false)
(check-expect (may-drive-but-not-drink? 16) true)
(check-expect (may-drive-but-not-drink? 18) true)
(check-expect (may-drive-but-not-drink? 20) true)
(check-expect (may-drive-but-not-drink? 21) false)
(check-expect (may-drive-but-not-drink? 22) false)
(define (may-drive-but-not-drink? age)
  ; age a number
  ; ( >= age 16) a boolean
  ; ( < age 21) a boolean
  (and (may-drive? age)
       (not(may-drink? age))))

(check-expect (win-craps? 2) false)
(check-expect (win-craps? 7) true)
(check-expect (win-craps? 9) false)
(check-expect (win-craps? 11) true)
(define (win-craps? num)
  ; num a number
  ; 7 a fixed number we'll need
  ; 11 a fixed number we'll need
  ; (= num 7) a boolean
  ; (= num 11) a boolean
  (or (= num 7)
      (= num 11)))

(define (play-craps x)
  ; x is a number
  ; 7 is a fixed number we'll need
  ; 11 is a fixed number we'll need
  (+ (roll-die 1) (roll-die 2)))

(define (not-13 num)
  (not (= num 13)))

(define (not-single-letter? str)
  ; str is a string
  ; (> str 1)
   (> (string-length str) 1))

(define (over-65-or-teenage age)
  ; age a number
  ; (teenage? age)
  ; (> age 65)
  (or (teenage? age)
      (> age 65)))

(check-expect (lose-craps? 2) true)
(check-expect (lose-craps? 7) false)
(check-expect (lose-craps? 9) true)
(check-expect (lose-craps? 11) false)
(check-expect (lose-craps? 12) true)
(define (lose-craps? num)
  ; num a number
  ; not 7
  ; not 11
  (not (win-craps? num)))

(define (is-not-red-square? image)
  ; image is an image
  (or (not (image=? (square 10 "solid" "red") image))
    (> (image-height image) (image-width image))
    (< (image-height image) (image-width image))))

(check-expect (any-two-same-pics? . ..) false)
(check-expect (any-two-same-pics? ...) true)
(check-expect (any-two-same-pics? . . .) true)
(check-expect (any-two-same-pics? . ..) true)

(define (any-two-same-pics? image1 image2 image3)
  (or (image=? image1 image2)
      (image=? image3 image1)
      (image=? image3 image2)))
