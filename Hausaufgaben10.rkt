#lang racket
#|Hausaufgabenblatt 10
Ney, Ramburger, Blaesche|#

(define spiel #(0 0 0 0 0 9 0 7 0
                0 0 0 0 8 2 0 5 0
                3 2 7 0 0 0 0 4 0
                0 1 6 0 4 0 0 0 0
                0 5 0 0 0 0 3 0 0
                0 0 0 0 9 0 7 0 0
                0 0 0 6 0 0 0 0 5
                8 0 2 0 0 0 0 0 0
                0 0 4 2 0 0 0 0 8))

(define (xy->index x y)
  (+ x (go-down y)))

(define (go-down y)
(if (= 0 y)
    10
    (* y 9)))