#lang racket
;Hausaufgaben 2

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
5. (eval tiger) -->
6. (eval katze) -->
7. (eval 'tiger) -->
8. (welcherNameGiltWo 'harry 'potter) --> 'harry (Ausdruecke werden nicht nacheinander ausgewertet)
9. (cdddr xs1) --> '(miau katze) (Liste wird ohne erste 3 Elemente ausgegeben (3 x d))
10 (cdr xs2) --> '(Plueschi) (Liste Plueschi Plueschi ohne 1. Element)
11. (cdr xs3) --> '(Plueschi . Plueschi) (cons fuegt 2 Elemente zu einem Paar zusammen)
12. (eval (sqrt 3)) -->
|#