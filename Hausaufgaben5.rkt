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

(define (fluelFarbe)
  '( ("gruen" 1)
   ("rot" 2)
   ("blau" 3)
   ("gelb" 4)))

(define (fuehlerForm)
  '(("gekruemt" 1)
    ("geschweift" 2)
    ("grade" 3)))

(define (fluegelForm)
  '(("rhombisch" 1)
    ("elliptisch" 2)
    ("hexagonal" 3)))

(define (muster)
  '(("sterne" 1)
    ("punkte" 2)
    ("streifen" 3)))

(define (fluegel fluegelM fuehlerM formM musterM fluegelV fuehlerV formV musterV anzahlKinder)
  (

(define (mendelHilfe 