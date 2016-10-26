#lang racket
#|Variable für eine Nautische Meile|#
(define nm 1.852)

#|Berechnet das Bogenmaß aus einer gegebenen Gradzahl nach der Formel:
(Grad * 2pi) / 360|#
(define (gradZuBogenmass grad)
  (/ (* grad 2 pi) 360))

#|Berechnet das Gradmaß aus einem gegebenen Bogenmaß nach der Formel:
360/ (2pi * Bogenmaß|#
(define (bogenmassZuGrad bogen)
(* (/ 360 (* 2 pi)) bogen))

#|Berechnet aus Nautischen Meilen die Kilometer|#
(define (nm-to-km nauticalMile)
  (* nauticalMile nm))
