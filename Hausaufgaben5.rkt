#lang racket
#| SE 3 FP Hausaufgaben Blatt 05, Blaesch, Ramburger, Ney |#
(require se3-bib/butterfly-module)
#|
Aufgabe 1.1
Funktionen: (generateFamily flügelformMutter flügelFormVater fühlerFormMutter füherformVater farbeMutter farbeVater musterMutter musterVater anzahlKinder) -> Generiert die Kinder durch zugriff auf die
rezesiven und dominanten Merkmale der Schmetterlinge. Elternmerkmale werden eingelesen, mit rezesiven ergänzt und dann zufällig an die Kinder verteilt. Gibt auch eine Liste mit allen Merkmalen der
Kinder und Eltern aus. 

Hilfsfunktionen: (randomRezesiveMerkmale) Gibt für einen Schmetterling 4 neue rezesive Merkmale aus den Tabellen wieder.
                 (merkmalsVergleichMitListe merkmal) Das Merkmal wird in der Liste gesucht und eine Liste mit dem Merkmal und dem Rest wird ausgegeben als rezesives Random element

Tabellen: Musterung: Hält alle möglichen Muster vom dominantesten bis zum rezesivsten
          Flügelfarbe: Hält alle Flügelfarben von dominant nach rezesiv
          Fühlerform: Hält alle Fühlerformen von dominant nach rezesiv
          Flügelform: Hält alle Flügelformen von dominant nach rezesiv
|#


(define fluegelFarbe '(green red blue yellow))

(define fluegForm '(rhomb ellipse hexagon))

(define fuehlerForm '(curly curved straight))

(define muster '(star dots stripes))

(define alleMerkmale '((green red blau gelb) (rhombisch elliptisch hexagonal) (grkruemt geschweift grade) (sterne punkte streifen)))

;;Vergleicht, welches der beiden eingegebenen Elemente dominanter ist.
(define (dominanzTest m1 m2 liste)
  (if (member m2 (member m1 liste))
      (display m2)
      (display m1)))

;;Diese Funktion generiert die Kinder am ende. Sie braucht als eingabe alle Dominanten und Rezesiven merkmale der Eltern und die anzhal der Kinder 
;;M steht für Mutter V steht für Vater R steht für Rezesiv und D für Dominant
(define (produceKids fluegelMD fluegelMR fuehlerMD fuehlerMR formMD formMR musterMD musterMR fluegelVD fluegelVR fuehlerVD fuehlerVR formVD formVR musterVD musterVR anzahlKinder)
  (0))


