#lang racket
;Hausaufgaben 2

#|Aufgabe 1 Symbole und Werte, Umgebungen|#

(define miau 'Plueschi)
(define katze miau)
(define tiger 'miau)

(define (welcherNameGiltWo PersonA PersonB)
  (let ((PersonA 'Sam)
        (PersonC PersonA))
    PersonC))

(define xs1 '(0 2 3 miau katze))
(define xs2 (list miau katze))
(define xs3 (cons katze miau))

#|
1. miau --> 'Plueschi
2. katze --> 'Plueschi (durch katze wird miau aufgerufen)
3. tiger --> 'miau ('miau ist hier ein symbol und keine Funktion)
4. (quote katze) --> (gleiche Auswrkung wie ' --> Eingabe wird zum symbol)
5. (eval tiger) --> 'Plueschi, weil eval die Quote auf 'miau ingnoriert und die funktion auswertet
6. (eval katze) -->  Fehler, weil eval versucht, 'Plueschi auszuführen, diese Funktion aber nicht definiert ist
7. (eval 'tiger) --> 'miau, da die evaluierung von 'tiger auf 'miau zeigt. eval zeigt hier die paramteter von tiger an.
8. (welcherNameGiltWo 'harry 'potter) --> 'harry (Ausdruecke werden nicht nacheinander ausgewertet)
9. (cdddr xs1) --> '(miau katze) (Liste wird ohne erste 3 Elemente ausgegeben (3 x d))
10 (cdr xs2) --> '(Plueschi) (Liste Plueschi Plueschi ohne 1. Element)
11. (cdr xs3) --> '(Plueschi . Plueschi) (cons fuegt 2 Elemente zu einem Paar zusammen)
12. (eval (sqrt 3)) --> 1.7320508075688772, da es hier keine Quote gibt und so sqrt einfach ausgewertet wird
13. (eval ’(welcherNameGiltWo ’tiger ’katze)) --> 'tiger, weil welcherNameGiltWo ausgewertet wird und PersonA immer ausgegeben wird--> 'tiger
14. (eval (welcherNameGiltWo ’katze ’tiger )) --> 'miau, weil tiger ausgewertet wird

eval ignoriert die erste Quote die es findet und wertet dem Ausdruck aus
|#