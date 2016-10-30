#lang racket

#|So nur zur Übersicht pack ich hier jetzt mal meine Lösung hinten dran:
Es funktioniert, hab ne Distanz von ca. 8588km raus. Ist allerdings umständlich
gemacht, ich bau nochmal so ne Hilfsfunktion wie du Timbo.
Ansonsten ist alles mehr oder weniger gleich
Versuche jetzt die letzte zu machen, wenn jemand nen tipp hat, wie man
vernünftig Listen aufstellt (man will ja nicht per Hand 0-360 aufschreiben,
kann man das vllt wie bei RegEx standatisiert abkürzen? --> 0-90 90-180 usw.)
wär ich sehr dankbar.|#

(define (radians-->degrees radians)
  (* (/ 360 (* 2 pi)) radians))

(define (degrees-->radians degrees)
  (* (/ (* 2 pi) 360) degrees))

(define (nm-->km nm)
  (* nm 1.852))

(define (my-acos cos)
  (atan (/ (sqrt (- 1 (sqr cos))) cos)))

(define sinphia (sin (degrees-->radians 59.95)))
(define sinphib (sin (degrees-->radians 22.20)))
(define cosphia (cos (degrees-->radians 59.93)))
(define cosphib (cos (degrees-->radians 22.20)))
(define cosdiff (cos (- (degrees-->radians 10.75) (degrees-->radians 114.10))))
(define dG (+ (* sinphia sinphib) (* cosphia cosphib cosdiff)))

(define distanzAB
(nm-->km (* 60 (radians-->degrees(my-acos dG)))))
