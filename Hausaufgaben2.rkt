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
11. (cdr xs3) --> 'Plueschi (cons fuegt 2 Elemente zu einem Paar zusammen, das 1. fällt weg)
12. (eval (sqrt 3)) --> 1.7320508075688772, da es hier keine Quote gibt und so sqrt einfach ausgewertet wird
13. (eval ’(welcherNameGiltWo ’tiger ’katze)) --> 'tiger, weil welcherNameGiltWo ausgewertet wird und PersonA immer ausgegeben wird--> 'tiger
14. (eval (welcherNameGiltWo ’katze ’tiger )) --> 'miau, weil tiger ausgewertet wird

eval ignoriert die erste Quote die es findet und wertet dem Ausdruck aus
|#

#|Aufgabe 2 Rechnen mit exakten Zahlen|#

;;2.1 Die Fakultät einer Zahl
;Berechnet die Fakultät einer Zahl nach der rekursiven Formel n! = n * (n-1)!
;Die Abbruchbedingung ist n = 0 --> 1
(define (fakul n)
  (if (negative? n)
      "n muss Element der Natürlichen Zahlen sein"
(
  (if (= n 0)
      1
       (* n (fakul (- n 1)))))))
;;2.2 Potenzen von Rationalen Zahlen
(define (power r n)
  (if (= n 0)
      1 
  (if (odd? n)
      (* r (power r (- n 1)))
      (sqr (power r (/ n 2))))))

;;2.3 Die Eulerzahl
(define (euler)
  (/(berechneEuler 1 2) 2))

(define (berechneEuler zaehler nenner)
  (if (< (/ zaehler nenner) (/ 1 (power 10 1000)))
      (+ (/ zaehler nenner) 1)
      (+ (/ zaehler (fakul nenner)) (/ (+ zaehler 1) (+ (fakul (+ nenner 1)))))))


#|Aufgabe 3 Typenprädikate|#

(define (type-of x)
  (cond [(boolean? x) "Boolean"]
        [(pair? x) "Pair"]
        [(list? x) "List"]
        [(symbol? x) "Symbol"]
        [(number? x) "Number"]
        [(char? x) "Char"]
        [(string? x) "String"]
        [(vector? x) "Vector"]
        [(procedure? x) "Procedure"]))

(define (id z)
  z)

#|
(type-of (* 2 3 4)) --> Number. 2*3*4 ist 24 und somit immer noch eine Number
(type-of (not 42)) --> Boolean. not wertet den Ausdruck zu einem wahrheitswert aus. Daher hier Boolean
(type-of '(eins zwei drei)) --> Pair
(type-of '()) --> List. Auch eine leere Liste ist eine Liste
(type-of (id sin)) --> Procedure. id gibt die eingabe wieder aus. sin ist ein Procedure
(type-of (string-ref "Harry_Potter_und_der_Stein_der_Weisen" 3)) --> Char. Der Dritte Buchstabe des Strings ist ein char
(type-of (lambda (x) x)) --> Procedure
(type-of type-of) --> Procedure. Type-of ist ein Procedure und wird als solches erkannt
(type-of (type-of type-of)) --> String
|#
        
