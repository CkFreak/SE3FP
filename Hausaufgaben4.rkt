#lang racket
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