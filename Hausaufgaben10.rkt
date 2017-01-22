#lang racket 
(require racket/vector)

;Sudokuspiel als Vektor
(define spiel #(0 0 0 0 0 9 0 7 0
                0 0 0 0 8 2 0 5 0
                3 2 7 0 0 0 0 4 0
                0 1 6 0 4 0 0 0 0
                0 5 0 0 0 0 3 0 0
                0 0 0 0 9 0 7 0 0
                0 0 0 6 0 0 0 0 5
                8 0 2 0 0 0 0 0 0
                0 0 4 2 0 0 0 0 8 ))

(define spielGeloest #(6 8 5 4 3 9 2 7 1
                       4 9 1 7 8 2 6 5 3
                       3 2 7 5 6 1 8 4 9
                       9 1 6 3 4 7 5 8 2
                       7 5 8 1 2 6 3 9 4
                       2 4 3 8 9 5 7 1 6
                       1 3 9 6 7 8 4 2 5
                       8 6 2 9 5 4 1 3 7
                       5 7 4 2 1 3 9 6 8 ))

(define spielFail #(   1 2 1 1 0 9 0 7 0
                       0 0 0 0 8 2 0 5 0
                       3 2 7 6 0 0 0 4 0
                       0 1 6 0 4 0 0 0 0
                       0 5 0 0 0 0 3 0 0
                       0 0 0 0 9 0 7 0 0
                       0 0 0 6 0 0 0 0 5
                       8 0 2 0 0 0 7 5 0
                       0 0 4 2 0 0 0 0 8 ))

;######Aufgabe 1.1######
;Aufgabe 1
;Gibt ein Index wieder durch Angabe der Spalte und Zeile
(define (xy->index xSpalte yZeile)
  (sub1 (+ (add1 xSpalte) (* yZeile 9))))

;Aufgabe 2
;Gibt eine Zeile aus dem Spiel als Liste wieder
(define (zeile->indizes xZeile)
  (map (lambda (x) (+ (* xZeile 9) x)) '(0 1 2 3 4 5 6 7 8)))

;Gibt eine Spalte aus dem Spiel als Liste wieder
(define (spalte->indizes xSpalte)
  (map (lambda (x) (+ xSpalte x))'(0 9 18 27 36 45 54 63 72)))

;Gibt einen Quadrant aus dem Spiel als Liste wieder
(define (quadrant->indizes xQuadrant)
  (if (< xQuadrant 3)
      (map (lambda (x) (+ (* 3 xQuadrant) x)) '(0 1 2 9 10 11 18 19 20))
      (if (< xQuadrant 6)
          (map (lambda (y) (+ (* 3 (- xQuadrant 3)) y)) '(27 28 29 36 37 38 45 46 47))
          (if (< xQuadrant 9)
          (map (lambda (z) (+ (* 3 (- xQuadrant 6)) z)) '(54 55 56 63 64 65 72 73 74))
          (write "Quadranten nur 0 bis 8")))))

;Aufgabe 3
;Gibt die Zahlen an den Bereichen(Zeile, Spalte oder Quadrant) wieder
(define (spiel->eintraege spiel funkBereich)
  (map (lambda (x) (list-ref (vector->list spiel) x)) funkBereich))

;Aufgabe 4
;Hilfsfunktionen um zu prüfen ob die Zeilen, Spalten und Quadranten konsistent sind, wenn ja erhalten wir eine Liste mit 9 Mal #f für jede Funktion
(define (löscheNull liste)
  (remove* '(0) liste))

(define (checkAlleZeilen spiel)
  (count false? (map check-duplicates (map löscheNull (map (lambda (x) (spiel->eintraege spiel (zeile->indizes x))) (range 0 9))))))

(define (checkAlleSpalten spiel)
  (count false? (map check-duplicates (map löscheNull (map (lambda (x) (spiel->eintraege spiel (spalte->indizes x))) (range 0 9))))))

(define (checkAlleQuadranten spiel)
  (count false? (map check-duplicates (map löscheNull (map (lambda (x) (spiel->eintraege spiel (quadrant->indizes x))) (range 0 9))))))

;Hauptfunktionen
;Wenn das Spiel konsistent ist haben wir in keiner Zeile,Spalte und Quadranten doppelte Zahlen(0 Ausgeschlossen), daher haben wir 9Zeilen+9Spalten+9Quadranten=27 abfragen, wenn nirgendwo doppelte Zahlen -> 27 mal false.
(define (spiel-konsistent? spiel)
  (if (eq? 27 (+ (checkAlleQuadranten spiel) (checkAlleSpalten spiel) (checkAlleZeilen spiel)))
      #t
      #f))
;Damit ein spiel geloest ist müssen alle Felder mit Zahlen außer Null belegt sein und das Spiel muss Konistent sein.
(define (spiel-geloest? spiel)
  (if (< 0 (count zero? (vector->list spiel)))
      #f
      (spiel-konsistent? spiel)))

;#######Aufgabe 1.2######
;Aufgabe 1
;Diverse Hilfsfunktionen
;Unser veränderbares Spiel als Vektor
(define hilfsSpiel(vector-copy spiel))

;Wir prüfen ob die Zahl an der Position 0 ist, wenn ja durch X ersetzen
(define (ersetzeNull position)
  (when (eq? 0 (vector-ref hilfsSpiel position))
                  (vector-set! hilfsSpiel position 'X)
                  ))

;Alle Indizes der Spalten,Zeilen und Quadranten als Liste
(define (alleZeilen)
         (map (lambda (x) (zeile->indizes x)) (range 0 9)))
(define (alleSpalten)
         (map (lambda (x) (spalte->indizes x)) (range 0 9)))
(define (alleQuadranten)
         (map (lambda (x) (quadrant->indizes x)) (range 0 9)))

;Jetzt überprüfen wir ob die Zahl in der Zeile,Spalte oder Quadranten vorkommt, wenn ja dann können die Nullen in dem Bereich erstzt werden
(define (überprüfeEinenBereich zahl bereich)
  (when (list? (member zahl (spiel->eintraege spiel bereich)))
      (map ersetzeNull bereich)
       ))

;Funktionen damit alle Zeilen,Spalten und Quadranten abgearbeitet werden
(define (überprüfeAlleZeilen zahl)
  (map (lambda (x) (überprüfeEinenBereich zahl x)) (alleZeilen)))
(define (überprüfeAlleSpalten zahl)
  (map (lambda (x) (überprüfeEinenBereich zahl x)) (alleSpalten)))
(define (überprüfeAlleQuadranten zahl)
  (map (lambda (x) (überprüfeEinenBereich zahl x)) (alleQuadranten)))

;Anzeige der möglichen Stellen für die Zahl durch Nullen und blockierte Stellen durch X
(define (markiere-ausschluss spiel zahl)
   (set! hilfsSpiel (vector-copy spiel)) ;Wir setzen hier das hilfsSpiel zurück damit wirs für andere Zahlen benutzen können ohne neu zu starten
   (überprüfeAlleZeilen zahl)
   (überprüfeAlleSpalten zahl)
   (überprüfeAlleQuadranten zahl)
   (write hilfsSpiel)
      )

;Aufgabe 2

;Hilfsfunktionen
;Wir überprüfen ob nur eine 0 in einem Bereich ist
(define (nurEineNull? liste)
  (if (eq? 1 (count zero?(filter number? (spiel->eintraege hilfsSpiel liste))))
      (list(suchePositionNull liste))
      '()))

;Da wir wissen das nur eine 0 da ist suchen wir mit dieser Funktion die Position der Null heraus
(define (suchePositionNull liste)
  (if (eq? 0 (car (spiel->eintraege hilfsSpiel liste)))
         (car liste)
         (suchePositionNull(cdr liste))))

;Wir erzeugen unser Hilfsspiel mit den blockierten Stellen gehen dann durch alle Zeilen,Spalten und Quadranten durch, suchen wo nur eine Null ist und speichern die Position dieser Nullen in einer Liste
(define (prüfeAufMöglichkeiten spiel zahl)
  (markiere-ausschluss spiel zahl)
  (display "\n") 
  (remove-duplicates 
  (append* (append (map nurEineNull? (map (lambda (x) (zeile->indizes x)) (range 0 9)))
  (map nurEineNull? (map (lambda (x) (spalte->indizes x)) (range 0 9)))
  (map nurEineNull? (map (lambda (x) (quadrant->indizes x)) (range 0 9)))))))



   

; Wiederholung, Klausurvorbereitung

#| Aufgabe 1
(a) -1. Zunächst wird 2-3 berechnet, davon und 2 das Minimum gesucht (-1)
und das Maximum von -1 ist -1.
(b) '(+ ,(- 2 4) 2). Das Quote am Anfang gibt an, dass alles in der
Klammer eine Liste ist.
(c) 'Alle. Mit car greift man auf das 1. Element einer Liste zu.
(d) '((dem See)). Mit cdr greift man auf den Rest einer Liste ohne das 1.
Element zu.
(e) '((Listen) sind einfach). cons fügt die 2 Listen zu einer
Liste zusammen.
(f) '(Paare . auch). cons fügt die 2 Elemente zu einem Paar zusammen.
(g) #t. list und ' sind äquivalente Listennoationen.
(h) #f. Da die beiden Listen zwar gleich aussehen, aber auf unterschiedliche
Objekte verweisen.
(i) '(3 6 9). map wendet die lamda Funktion auf jedes Element der Liste an.
(j) '(2 4). filter filtert die Liste nach der Bedingung even?.
(k) 2.
(l) #t.
|#

#| Aufgabe 2 |#

(define *a* 10)
(define *b* '*a*)
(define (merke x) (lambda () x))
(define (test x)
  (let ((x (+ x *a*)))
    (+ x 2)))

#|
(a) 10. Wohdefiniert.
(b) Geht nicht, da *b* nicht zu einer Zahl evaluiert. Nicht wohldefiniert.
(c) 20. Durch das eval wird das '*a* nun ausgewertet zu 10.
(d) #f. Die 1. Bed. ist nicht erfüllt. Ebenso kann '*a* nicht mit >
verglichen werden. Nicht wohldefiniert.
(e) #f. Weder ist 10 > 10, noch darf man durch 0 teilen.
(f) #f. ?
(g) 5. ?
(h) 16. 4 + 10 + 2, da dass x immer erst zu x + 10 ausgewertet wird und
anschließend + 2 gerechnet wird.
Was genau bedeutet Wohldefinertheit im Informatik Kontext?
|#

#| Aufgabe 3 |#
; (a):
(+ (* 3 4) (* 5 6))
; (b):
(define (blub x)
  (sqrt (- 1 (sqr (sin x)))))

#| Aufgabe 4 |#
; (a):
(define (c a b)
  (sqrt (+ (sqr a) (sqr b))))
; (b):
(define (mytan a)
  (/ (sin a) (blub a)))

#| Aufgabe 5 |#
; (a):
(/ (+ 1 4) (- 2 1))
; (b):
(/ (- 2 (/ (+ 1 3) (+ 3 (* 2 3)))) (sqrt 3))

#|Aufgabe 6 |#
; (1 + 2 + 3) * (2 - 3 - 2/3)

#| Aufgabe 7
(a) Bei innerer Reduktion wird zunächst versucht, die 'tiefste' Ebene
auszuwerten. Von da geht man immer weiter hoch, bis schhließlich der
gesamte Ausdruck ausgewertet wird. Dieses Reduktionsmodell benutzt Racket
normalerweise.
Bei äußerer Reduktion wird zunächst versucht die 'höchste' Ebene als
erstes auszuwerten. Die darin enthaltenen Ausdrücke werden so spät wie
möglich ausgewertet. Racket benutzt diese Form der Reduktion hinter den
special form operators.
(b)
|#
