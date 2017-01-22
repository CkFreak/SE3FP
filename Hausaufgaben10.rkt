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