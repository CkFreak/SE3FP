#lang racket
#|Hausaufgabenblatt 10
Ney, Ramburger, Blaesche|#

(define spiel #(0 0 0 0 0 9 0 7 0
                0 0 0 0 8 2 0 5 0
                3 2 7 0 0 0 0 4 0
                0 1 6 0 4 0 0 0 0
                0 5 0 0 0 0 3 0 0
                0 0 0 0 9 0 7 0 0
                0 0 0 6 0 0 0 0 5
                8 0 2 0 0 0 0 0 0
                0 0 4 2 0 0 0 0 8))

(define (xy->index x y)
  (+ x (go-down y)))

(define (go-down y)
(if (= 0 y)
    10
    (* y 9)))

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