#lang racket
#|1 Konversionsfunktionen|#

;;1.1Bogenmaß und Grad

;Bogenmaß zu Grad
(define (radians-->degrees radians)
  (* (/ 360 (* 2 pi)) radians))

;Grad zu Bogenmaß
(define (degrees-->radians degrees)
  (* (/ (* 2 pi) 360) degrees))

;;1.2 Umkehrfunktion acos
(define (my-acos cos)
  (atan (/ (sqrt (- 1 (sqr cos))) cos)))

;;1.3 Kilometer und Seemeilen
(define (nm-->km nm)
  (* nm 1.852))


#|2 Großkreisentfernung und Kurse|#


;;2.1 Großkreisentfernung
(define (distanzAB laenge0 laenge1 breite0 breite1)
(nm-->km (* 60 (radians-->degrees(my-acos (dG laenge0 laenge1 breite0 breite1))))))

;Berechnet mit hilfe anderer Hilfsfunktionen die Entfernung zweier Punkte auf der Erdoberfläche
(define (dG laenge0 laenge1 breite0 breite1)
  (+ (* (sinphia laenge0) (sinphib laenge1)) (* (cosphia laenge0)
                                                (cosphib laenge1)
                                                (cosdiff breite0 breite1))))

;Eine Reihe von Hilfsfunktionen zur Entfernungsberechnug 
(define (cosdiff breite0 breite1)
(cos (- (degrees-->radians breite0) (degrees-->radians breite1))))

(define (cosphib breite)
  (cos (degrees-->radians breite)))

(define (cosphia laenge)
  (cos (degrees-->radians laenge)))

(define (sinphib breite)
  (sin (degrees-->radians breite)))

(define (sinphia laenge)
  (sin (degrees-->radians laenge)))

;;2.3 Himmelsrichtungen
;Grad in Himmelsrichtung umwandeln
(define (gradZuHimmelsrichtung grad)
  (cond [(<= grad 11.25) 'N]
      [(<= grad 33.75) 'NNE]
      [(<= grad 56.25) 'NE]
      [(<= grad 78.75) 'ENE]
      [(<= grad 101.25) 'E]
      [(<= grad 123.75) 'ESE]
      [(<= grad 146.5) 'SE]
      [(<= grad 168.75) 'SSE]
      [(<= grad 191.25) 'S]
      [(<= grad 213.75) 'SSW]
      [(<= grad 236.25) 'SW]
      [(<= grad 258.75) 'WSW]
      [(<= grad 281.25) 'W]
      [(<= grad 303.75) 'WNW]
      [(<= grad 326.25) 'NW]
      [(<= grad 348.75) 'NNW]
      [(<= grad 360) 'N]
      [else "Die Gradzahl muss im Bereich zwischen 0° und 360° liegen!"]))

;Himmelsrichtung in Grad umwandeln
(define (himmelsrichtungZuGrad richtung)
    (cond
      [(equal? richtung 'N) 0]
      [(equal? richtung 'NNE) 22.5]
      [(equal? richtung 'NE) 45]
      [(equal? richtung 'ENE) 67.5]
      [(equal? richtung 'E) 90]
      [(equal? richtung 'ESE) 112.5]
      [(equal? richtung 'SE) 135]
      [(equal? richtung 'SSE) 157.5]
      [(equal? richtung 'S) 180]
      [(equal? richtung 'SSW) 202.5]
      [(equal? richtung 'SW) 225]
      [(equal? richtung 'WSW) 247.5]
      [(equal? richtung 'W) 270]
      [(equal? richtung 'WNW) 292.5]
      [(equal? richtung 'NW) 315]
      [(equal? richtung 'WNW) 337.5]   
      ))
