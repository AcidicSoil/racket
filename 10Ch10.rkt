;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ch10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(provide number->image)
;(provide (all-defined-out))


(define (add-str s)
  (string-append  s "b"))

(define (a-with-b s)
   (text s 18 "green"))

(define (chop-first-on-mouse s mouse-x mouse-y me)
  (substring s (min 1 (string-length s))))



(define (string-world s)
  (big-bang s
    (check-with string?)
    (on-tick add-str 1/2)
    (on-draw a-with-b 200 200)
    (on-mouse chop-first-on-mouse)
    ))

;(string-world  "a" )

; animation that displays the word "cat"

(define (first-half s)
  (substring s 0 (floor(/ (string-length s) 2))))

(define (last-half s)
  (substring s (floor(/ (string-length s) 2)) (string-length s)))

(define (insert-in-middle s)
  (string-append (first-half s) "xyz" (last-half s)))

(define (cat-function s)
  (text s 18 "green"))

(big-bang "cat"
  (check-with string?)
  (on-tick insert-in-middle 1)
  (on-draw cat-function 200 200))

; Digital clock

(define (number->image num)
  (text (number->string num) 18 "blue"))

(define (show-number num)
  (number->image num))

(big-bang 0
  (check-with number?)
  (on-tick add1 1)
  (on-draw show-number 200 200))

; Moving digital clock

(define blank-screen
  (rectangle 200 200 "solid" "white"))


(define (num-mover num)
  (+ num 1))

(define (move-x-coord num)
  (place-image (number->image num)
               (num-mover num) 100
               blank-screen))

(big-bang 1
  (check-with number?)
  (on-tick add1 1)
  (on-draw move-x-coord))

(define (coord->image s)
  (text s 18 "blue"))

(define (show-coord s)
  (coord->image s))
 
(define (mh s mouse-x mouse-y me)
  (string-append "("
                 (number->string mouse-x)
                 ","
                 (number->string mouse-y)
                 ")"))

(define (string-world-1 s)
  (big-bang s 
    (check-with string?)
    (on-draw show-coord 200 200)
    (on-mouse mh)))

(string-world-1 "")
