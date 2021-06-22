;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Chapter 9 Working with strings|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; string-append : string ...-> string

(string-append "hello" "there" "friend")
"hellotherefriend"

(string-append "hello " "there" " " "friend")
"hello there friend"

; string-length : string -> integer

(string-length "hellothere")

(string-length "Hi there, friend!")

; substring : string integer(start) [integer(end)] -> string

; number->string : number -> string

; string->number : string -> number

(string->number "four")

(define me
  "Clayton Bivens")

(string-append me " works")

(string-length me)

(substring me 7)

(define (repeat str)
  (string-append str str))

(define (chop-first-char str)
  (substring str 0 (string-length str)))

(chop-first-char "dog")

(define (first-char str)
  (substring str 0))

(define (last-half str)
  (substring str (floor(/ (string-length str) 2)) (string-length str)))

(define (first-half str)
  (substring str 0 (floor(/ (string-length str) 2))))

(define (number->image num)
  (text (number->string num) 18 "blue"))

(define (digits pos-num)
   (string-length (number->string pos-num)))

(string-append(first-half " ")(last-half ""))
(first-char "dog")