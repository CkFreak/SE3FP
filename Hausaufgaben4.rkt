#lang racket
(require SE3-bib/Hausaufgaben3)
#|
Softwareentwicklung 3 Blatt 4

Aufgabe 1 Auswertung von Ausdrücken
|#
  
(max(min 5 (- 6 7)) 8)

'(+ (- 11 13) 17)

(cadr '(Alle Jahre wieder))

(cddr '(kommt (das Christuskind)))

(cons 'Auf'(die Erde nieder))

(cons 'Wo 'wir)

(equal? (list 'Menschen 'sind) '(Menschen sind))

(eq? (list 'Rudolph 'Das 'Rentier) (cons 'Rudolph '(Das Rentier)))

#|
(max(min 5 (- 6 7)) 8) -> 8

'(+ (- 11 13) 17) -> '(+ (- 11 13) 17)

(cadr '(Alle Jahre wieder)) -> 'Jahre

(cddr '(kommt (das Christuskind))) -> '()

(cons 'Auf'(die Erde nieder)) -> '(Auf die Erde nieder)

(cons 'Wo 'wir) -> '(Wo . wir)

(equal? (list 'Menschen 'sind) '(Menschen sind)) -> #t

(eq? (list 'Rudolph 'Das 'Rentier) (cons 'Rudolph '(Das Rentier))) -> #f
|#

#|Aufgabe 2 Textgenerierung|#

;;2.1 Die Grammatik
(define (notmelde-grammatik)
  '(<Notmeldung> ::= <Notzeichen> <Notzeichen> <Notzeichen>
                 <Landeskennung> <Schiffsname> <Schiffsname> <Schiffsname> <Rufzeichen>
                 <Notzeichen> <Schiffsname> <Schiffsname buchstabiert> <Rufzeichen buchstabiert>
                 <Standortangabe>
                 <Art des Notfalls>
                 <Erforderliche Hilfeleistungen>
                 <Zwei Peilzeichen>
                 <Unterschrift>
                 <Endzeichen>)
  '(<Notzeichen> ::= MAYDAY)
  '(<Landeskennung> ::= <Element der Buchstabiertafel> / HIER IST)
  '(<Schiffsname> ::= <Buchstaben>)
  '(<Rufzeichen> ::= <Kennung>)
  '(<Schiffsname buchstabiert> ::= )
  '(<Rufzeichen buchstabiert> ::=)
  '(<Standortangabe> ::= <Koordinaten>)
  '(<Art des Notfalls> ::= String)
  '(<Erforderliche Hilfeleistungen> ::= String)
  '(<Zwei Peilzeichen> ::= ICH SENDE DEN TRÄGER)
  '(<Unterschrift> ::= <Schiffsname> <Schiffsname buchstabiert>)
  '(<Endzeichen> ::= OVER)
  '(<Buchstaben> ::= A B
                 C D
                 E F
                 G H
                 I J
                 K L
                 M N
                 O P
                 Q R
                 S T
                 U V
                 W X
                 Y Z
                 a b
                 c d
                 e f
                 g h
                 i j
                 k l
                 m n
                 o p
                 q r
                 s t
                 u v
                 w x
                 y z)
  '(<Kennung> ::= <Buchstabe> <Buchstabe> <Buchstabe> <Buchstabe>)
  '(<Koordinaten> ::= <Ziffer mit Null> <Ziffer ohne Null> ° <Ziffer mit Null> <Ziffer ohne Null> ’ <Erdhablbkugel>
                  <Ziffer mit Null> <Ziffer ohne Null> ° <Ziffer mit Null> <Ziffer ohne Null> ’ <Ost oder West>)
  '(<Ziffer mit Null> ::= 0 / 1 / 2 / 3 / 4 / 5 / 6 / 7 / 8 / 9)
  '(<Ziffer ohne Null> ::= 1 / 2 / 3 / 4 / 5 / 6 / 7 / 8 / 9)
  '(<Erdhalbkugel> ::= N / S)
  '(<Ost oder West> ::= O / W)

                 
  )

;Aufgabe 3.1:

( define ( hoch4 x ) ( * x x x x ) )
( hoch4 ( * 3 (+ 1 ( hoch4 2 ) ) ) )
#|Innere Reduktion: Der Ausdruck wird von innen nach außen ausgewertet:
Bei (hoch4 (* 3 (+ 1 (hoch4 2)))) wird mit (hoch4 2) begonnen := 16.
Nun wird der nächst-innere Ausdruck ausgewertet: (+ 1 16) := 17.
Nun (* 3 17) := 51
Zuletzt (hoch4 51) = 6.765.201
Aeußere Reduktion: Der Ausdruck wird von außen nach innen ausgewertet:
Bei (hoch4 (* 3 (+ 1 (hoch4 2 )))) wird (hoch4 (...)) zuerst ausgewerte:
(* (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2))) (* 3 (+ 1 (hoch4 2 )))).
Jetzte alle Ausdrücke der höchsten auswertbaren Ebene von links nach rechts:
(hoch4 2):
(* (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2)))).
Erst jetzt wird wirklich angefangen Werte einzusetzen:
(* (* 3 (+ 1 16)) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))))
(* (* 3 17) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 (* 3 (+ 1 16)) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 (* 3 17) (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 51 (* 3 (+ 1 (* 2 2 2 2))) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 51 (* 3 (+ 1 16)) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 51 (* 3 17) (* 3 (+ 1 (* 2 2 2 2))))
(* 51 51 51 (* 3 (+ 1 (* 2 2 2 2))))
(* 51 51 51 (* 3 (+ 1 16))))
(* 51 51 51 (* 3 17))
(* 51 51 51 51) = 6765201.
|#

;Aufgabe 3.2:

; In Racket wird für Funktionen die innere Reduktion und für
; Spezialformen die äußere Reduktion angewendet.

;Aufgabe 3.3:

#|
Selbstgeschriebenen Funktionen arbeiten bei Racket nach der inneren Reduktion,
dass bedeutet das wir in unserem new-if erstmal die else-clause berechnen, speziell in unserem Beispiel
bedeutet es, dass wir immer wieder die faculty function rekursiv aufrufen, bevor überhaupt geprüft wird,
ob(> counter max−count) eintritt, unsere Funktion terminiert also nicht.
|#

