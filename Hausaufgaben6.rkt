#lang racket
#|Hausaufgaben Blatt 06 Blaesch Ramburger Ney|#

(require 2htdp/image)
(require 2htdp/universe)
(require lang/posn)

;Schneeflocken, die ebenfalls den Zeitparameter übergeben bekommen und dementsprechend blinken
;Auch bei den Schneeflocken sind wir ähnlich vorgegangen wie bei den Geschenken haben sie zufällig,
;aber in Abhängigkeit einer "MainSchneeflocke" erstellt. Führt leider zu einer ungleichmäßigen Verteilung,
;aber für was anderes hat die Zeit nicht mehr gereicht.
(define (schnee t)
  (underlay/xy
   (underlay/xy
    (underlay/xy
    (underlay/xy
    (circle 0 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    (random 250) (random 50)
    (underlay/xy
    (circle 0 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    )
    (random 250) (random 50)
    (underlay/xy
    (underlay/xy
    (circle 0 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    (random 250) (random 50)
    (underlay/xy
    (circle 0 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    )
    )
   (random 250) (random 50)
   (underlay/xy
    (underlay/xy
    (underlay/xy
    (circle 2 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    (random 250) (random 50)
    (underlay/xy
    (circle 2 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    )
    (random 250) (random 50)
    (underlay/xy
    (underlay/xy
    (circle 2 "solid" "white")
    (random 250) (random 50)
    (circle 2 "solid" "white")
    )
    (random 250) (random 50)
    (underlay/xy
    (circle 2 "solid" "white")
    (random 112) (random 50)
    (circle 2 "solid" "white")
    )
    )
    )
   )
  )

;Erstellt eine Baumkrone
(define (baumKrone groesse)
  (if (> groesse 0)
      (underlay/offset
       (triangle groesse "solid" (list-ref '("darkgreen" "darkolivegreen" "forestgreen" "mediumforestgreen" "seagreen") (random 5)))
       0 (- (* groesse 0.5))
   (baumKrone(- groesse 20)))
  (underlay (triangle 5 "solid" (list-ref '("darkgreen" "darkolivegreen" "forestgreen" "mediumforestgreen" "seagreen") (random 5)))
            (triangle 0 "solid" "green" )
            )
  )
  )

;Zeichnet einen Baum aus Krone und Stamm
(define (zeichneBaum size)
    (above
     (baumKrone size)
     (rectangle (/ size 5) (/ size 3) "solid" (list-ref '("brown" "chocolate" "sienna" "saddlebrown") (random 4)))))

(define (wald breite)
  (if (> breite 0)
      (underlay/xy
       (zeichneBaum 40)
       (random 20) 0
       (wald (- breite 10))
       )
      (square 0 "solid" "brown")
      ))

;kleine Nebenfunktion, damit der Wald aufhört zu blinken :) (lag ebenfalls am Zeitparameter)
(define waldFix
  (wald 550)
  )

;Komplizierter Bau von Rentieren, da erstellt, bevor wir die Polygone entdeckt haben.
;Leider ohne Geweih.
(define (rentier t special)
     (underlay/xy
      (underlay/xy
       (ellipse 35 18 "solid" "brown") ;Rumpf
        -5 10
        (underlay/xy
         (underlay/xy
          (cond
           [(and (> (modulo t 12) -1) (< (modulo t 12) 3)) (underlay/xy (square 0 "solid" "black") 5 0 (ellipse 4 20 "solid" "black"))] ;Hinterbein gerade
           [(and (> (modulo t 12)  2) (< (modulo t 12) 6)) (rotate -30 (ellipse 4 20 "solid" "black"))] ;Hinterbein nach hinten
           [(and (> (modulo t 12) 5) (< (modulo t 12) 9)) (underlay/xy (square 0 "solid" "black") 5 0 (ellipse 4 20 "solid" "black"))] ;Hinterbein gerade
           [(and (> (modulo t 12)  8) (< (modulo t 12) 12)) (underlay/xy (square 0 "solid" "black") 5 0 (rotate 30 (ellipse 4 20 "solid" "black")))] ;Hinterbein nach vorne
           )
         0 0
         (cond
           [(and (> (modulo (+ t 6) 12) -1) (< (modulo (+ t 6) 12) 3)) (underlay/xy (square 0 "solid" "brown") 5 0 (ellipse 4 20 "solid" "brown"))] ;Hinterbein gerade
           [(and (> (modulo (+ t 6) 12)  2) (< (modulo (+ t 6) 12) 6)) (rotate -30 (ellipse 4 20 "solid" "brown"))] ;Hinterbein nach hinten
           [(and (> (modulo (+ t 6) 12) 5) (< (modulo (+ t 6) 12) 9)) (underlay/xy (square 0 "solid" "brown") 5 0 (ellipse 4 20 "solid" "brown"))] ;Hinterbein gerade
           [(and (> (modulo (+ t 6) 12)  8) (< (modulo (+ t 6) 12) 12)) (underlay/xy (square 0 "solid" "brown") 5 0 (rotate 30 (ellipse 4 20 "solid" "brown")))] ;Hinterbein nach vorne
           )
         )
         
        30 0
        (underlay/xy
         (cond
           [(and (> (modulo t 12) -1) (< (modulo t 12) 3)) (underlay/xy (square 0 "solid" "black") 5 0 (ellipse 4 20 "solid" "black"))]  ;Vorderbein gerade
           [(and (> (modulo t 12)  2) (< (modulo t 12) 6)) (underlay/xy (square 0 "solid" "black") 5 0 (rotate 30 (ellipse 4 20 "solid" "black")))] ;Vorderbein nach vorne
           [(and (> (modulo t 12) 5) (< (modulo t 12) 9)) (underlay/xy (square 0 "solid" "black") 5 0 (ellipse 4 20 "solid" "black"))] ;Vorderbein gerade
           [(and (> (modulo t 12)  8) (< (modulo t 12) 12)) (rotate -30 (ellipse 4 20 "solid" "black"))] ;Vorderbein nach hinten
           )
         0 0
         (cond
           [(and (> (modulo (+ t 6) 12) -1) (< (modulo (+ t 6) 12) 3)) (underlay/xy (square 0 "solid" "brown") 5 0 (ellipse 4 20 "solid" "brown"))]  ;Vorderbein gerade
           [(and (> (modulo (+ t 6) 12)  2) (< (modulo (+ t 6) 12) 6)) (underlay/xy (square 0 "solid" "brown") 5 0 (rotate 30 (ellipse 4 20 "solid" "brown")))] ;Vorderbein nach vorne
           [(and (> (modulo (+ t 6) 12) 5) (< (modulo (+ t 6) 12) 9)) (underlay/xy (square 0 "solid" "brown") 5 0 (ellipse 4 20 "solid" "brown"))] ;Vorderbein gerade
           [(and (> (modulo (+ t 6) 12)  8) (< (modulo (+ t 6) 12) 12)) (rotate -30 (ellipse 4 20 "solid" "brown"))] ;Vorderbein nach hinten
           )
         )
       )
       )
      28 -5
      (underlay/xy
        (ellipse 15 9 "solid" "brown") ;Kopf
        10 1
            (underlay/offset
             (if special
                 (circle 2 "solid" (list-ref '("black" "red") (random 2))) ;Rudolphs Nase
                 (circle 2 "solid" "black") ;Nase
             )
             -4 -2
             (circle 1 "solid" "black") ;Auge
             )
        )
      )
  )

;Schlitten (in Polygonen) wesentlich übersichtlicher
(define schlitten
  (underlay/xy
   (polygon
    (list (make-posn -5 0)
          (make-posn 10 0)
          (make-posn 15 5)
          (make-posn 65 10)
          (make-posn 60 30)
          (make-posn 0 30)
          )
    "solid" "peru")
   -5 23
   (underlay/xy
    (rectangle 75 5 "solid" "black")
    70 -6
    (rotate -30 (rectangle 5 10 "solid" "black"))
    )
   )
  )

;Diese Funktion haben wir ursprünglich vom Ufo-Beam abgeleitet.
(define (geschenkeAbwurf t)
  (underlay/xy
   (underlay/xy
       schlitten
       80 0
       (underlay/xy
        (rentier t #f)
        50 ( * ( sin ( / t 4)) 3)
        (underlay/xy
         (rentier t #f)
         50 ( * ( sin ( / t 4)) 3)
         (rentier t #t)
         )
        )
       )
   (+ 30 (random 10)) (modulo t 120) ;Der Geschenkeabwurf entseht zufällig um ein bestimmtes "MainGeschenk" herum, in einem Abstand von  max. 10 Pixeln,
    (underlay/xy                     ;damit kein Muster zu erkennen ist und es nach einer großen zufälligen Geschenkewolke aussieht.
     (underlay/xy
      (geschenk t)
      (random 10) (random 10)
      (geschenk t)
      )
     (random 10) (random 10)
     (underlay/xy
      (geschenk t)
      (random 10) (random 10)
      (geschenk t)
      )
     )
      
   )
  )

;Blinkende Geschenke (mitSchleife) die Santa über nem Wald abwirft
(define (geschenk t) ;der Parameter t wird benötigt, um die Geschenke jedes mal neu zu generieren, sonst sind sie einfarbig
  (let ((sizeX (random 5 9)) (sizeY (random 5 9)) (color (list-ref '("blue" "green" "yellow" "red") (random 4)))) ;Geschenke haben zufällige Größe und Farbe
    (underlay/align "center"
                    "center"
                    (rectangle sizeX sizeY "solid" (list-ref '("blue" "green" "yellow" "red") (random 4)))
                    (rectangle sizeX 1 "solid" color)
                    (rectangle 1 sizeY "solid" color)
                    )
                  )
)

;Auslagerung des Hintergrundbildes, der Übersichtlichkeit halber; wird ebenfalls nach dem time Variablen immer neu gezeichnet,
;da Santa sonst aus dem Himmel flog
(define (himmel t)
  (underlay/xy
                  (rectangle 550 200 "solid" "darkblue")
                  0 0
                  (schnee t)
                  )
  )

;Ihren Ursprung hatte die Funktion in der Ufo-Szene, die auf dem Aufgabenblatt aufgeschrieben war.
(define (create-Santa-scene t)
    (underlay/xy (underlay/xy
                  (himmel t)
                  0 139
                  waldFix
                  )
                 (modulo t 500) (* (modulo t 500) 0.12)
                 (geschenkeAbwurf t)
                 )
  )

(animate create-Santa-scene)