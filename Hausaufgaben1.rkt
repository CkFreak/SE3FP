#lang racket
; grad * 2 * pi /360
(define (gradZuBogenmass grad)
  (/ (* grad 2 pi) 360))


;360/2*pi * bogenmaß
(define (bogenmassZuGrad bogen)
(* (/ 360 (* 2 pi)) bogen))