#lang racket

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
  (* nauticalMile 1.852))

#|Arkuskosinus|#
(define (my-acos winkel)
  (* 2 (atan (sqrt (/ (- 1 winkel) (+ 1 winkel))))))


(define (distanzAB laengeA breiteA laengeB breiteB)
  (nm-to-km (* 60 (bogenmassZuGrad (my-acos (bogenmassDistanzHilfe laengeA breiteA laengeB breiteB))))))


(define (bogenmassDistanzHilfe laengeA breiteA laengeB breiteB)
  (+
   (* (sin (gradZuBogenmass breiteA))
      (sin (gradZuBogenmass breiteB)) )
     (* (cos (gradZuBogenmass breiteA))
        (cos (gradZuBogenmass breiteB))
        (cos (abs (- 
              (gradZuBogenmass laengeB)
                (gradZuBogenmass laengeA)))))))