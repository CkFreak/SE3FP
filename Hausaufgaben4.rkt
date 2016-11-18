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

