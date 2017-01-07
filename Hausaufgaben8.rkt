#lang racket
#|Aufgabe 1.1
Eine Funktion in Racket ist dann eine Funktion höherer Ordnung, wenn sie eine Funktion als Variable entgegennehmen oder als Rückgabewert haben. 

Aufgabe 1.2
a) foldr
Hierbei handelt es sich um eine Funktion Höherer Ordnung. foldr nimmt eine Zwei Parametrige Funktion als input und einen Basiswert.
Die Funktion wird dann auf eine Liste mit Werten angewandt.

b) (plus-oder-minus x)
Diese Funktion gibt aus, ob der eingegebene Wert x positiv oder negativ ist.
Es wird keine Funktion engegegengenommen oder zurückgegeben. Also handlet es sich hierbei nicht um eine Funktion Höherer Ordnung.

c) (masala f arg1)
Diese Funktion wendet die Funktion f auf den Basiswert arg1 an. arg2 ist innerhalb der Funktion definiert und muss für das Lambda mit übergeben werden.
Es handelt sich in sofern um eine Funktion Höherer Ordnung, als das f übergeben wird. Es gibt nur dann eine Funktion als Ausgabe, wenn f
auch eine Funktion ausgibt.

d) (flip f)
Diese Funktion dreht die Eingaben für f um und ruft f dann mit den gedrehten Eingaben auf. Es handlet sich um eine Funktion höhrerer Ordnug,
da f als Varibale übergeben wird. Die Ausgabe hängt von der Übergebenen Funktion f ab.

Aufgabe 1.3

Die Funktion "masala" hat zwei Umgebungen. Die erste Umgebung ist der
Funktionsaufruf:(masala / 1). Die zweite Umgebung verwendet die Funktion, welche wir aus
(masala / 1) erhalten mit der 3, also (procedure 3).
In der ersten Umgebung binden wir die Funktion / und den Wert 1 und erzeugen dadurch ein closure.
In der zweiten Umgebung binden wir dann den Wert 3 an die Closure werten sie aus.
|#

;4.)
(define (flip f)
(lambda (x y) (f y x)))

(foldl (curry * 3) 1 '(1 2 3))
#|-->162
 Wir erzeugen eine Funktion die jeden Wert * 3 nimmt, zudem haben wir die Startwert 1 und die Liste '(1 2 3).
 Wir rechnen also als erstes:
 (curry * 3) 1 1 , also 3*1*1 --> 3
 Dann:
 (curry * 3) 3 2 , also 3*3*2 --> 18
 und zu letzt:
 (curry * 3) 18 3, also 3*18*3 --> 162
|#

(map (flip cons) '(1 2 3) '(3 2 1))
#|-->'((3 . 1) (2 . 2) (1 . 3))
 Die Funktion map nutzt unsere Funktion (flip cons) auf die beiden Listen an und erstellt dann eine Liste davon.
 Da (lambda (x y) (f y x)) in unserer flip Funktion gilt nehmen wir immer erst das n-te Element aus der zweiten Liste,
 und verbinden es dann durch cons mit dem n-ten Element aus der ersten Liste zu einem pair, so erhalten wir:
(3 . 1) -> (3 . 1) (2 . 2) -> (3 . 1) (2 . 2) (1 . 3)
|#

(filter list? '((a b) () 1 (())))
#|Die Funktion filter gibt alle Elemente aus einer Liste zurück für die unsere Bedingung, in unserem Fall list?, gilt.
 (list? (a b)) -> #t
 (list? ()) -> #t
 (list? 1 -> #f
 (list? (())) -> #t
 Wir erhalten also alle Listen aus unserer Anfangsliste: '((a b) () (()))
 
|#
(map (compose (curryr / 1.8) (curry - 32))
 '(9941 212 32 -459.67 ))
#|--> '(-5505.0 -100.0 0 273.15)
 Die Funktion map beschreibt das wir auf jedes Element aus der Liste unsere Funktion (compose (curryr / 1.8) (curry - 32) anwenden.
 Durch compose beschreiben wir die Reihenfolge (Von rechts nach links), also subtrahieren wir erst, dann dividieren wir.
 Durch Curryr beschreiben wir, dass wir durch 1.8 dividieren(1.8 steh in der Gleichung rechts) und durch curry das wir von 32 subtrahieren
 (32 steht in der Gleichung links).
 ((/ (- 32 9941) 1.8) (/ (- 32 212) 1.8) (/ (- 32 32) 1.8) (/ (- 32 -459.67) 1.8) 
|#

;Aufgabe 2.)

;Erzeugen einer neuen Liste mit den absoluten Beträgen.
(define (absolut xs)
       (map abs xs))

;Filtern aller Elemente aus einer Liste, die durch 13 teilbar sind.
(define (durchDreiZehn xs)
       (filter (compose zero? (curryr modulo 13)) xs))

;Filtern aller Elemente aus einer Liste, die größer als 3 sind und gerade sind.
(define (geradeGroeßer3 xs)
       (filter even? (filter (curry < 3) xs)))
       
;Teilt eine Liste in eine Liste mit geraden Elemnten und einer Liste mit ungeraden Elementen.
(define (ungeradeGerade xs)
        (partition even? xs))
        
        
;Aufgabe 3.1)

;Die verschiedenen Eigenschaften der Karten in einzelnden Listen.
(define pattern '(waves oval rectangle))
(define color '(red green blue))
(define n '(1 2 3))
(define mode '(outline solid hatched))

;Erzeugen einer Beispielkarte als mit den Eigenschaften als Liste(Anzahl, Form, Füllung, Farbe)
(define rndmKarte '(waves red 1 outline))

;Aufgabe 3.2)

;Erstelle Kartendeck
(define erstelleDeck(cartesian-product n pattern mode color))

;Erzeugt die verschiedenen Karten an Hand ihrer Attribute
(define (erstelleKarte karte)
   (apply show-set-card karte)
   )

;Erzeugt alle Karten auf der Konsole
(define(zeigeKarten)
   (map erstelleKarte erstelleDeck)
   )


;Aufgabe 3.3)

;Eine Hilfsfunktion um die Drei Karten in Ihren Verschiedenen Eigenschaften zu Sortieren,
;die Farbe bekommt eine eigene Unterliste, die Form eine usw.
(define(eigenschaftenListe karte1 karte2 karte3)
(list(list(first karte1) (first karte2) (first karte3))
(list(second karte1)(second karte2) (second karte3))
(list(third karte1) (third karte2) (third karte3))
(list(fourth karte1) (fourth karte2) (fourth karte3))))

;Hilfsfunktion um in den Unterlisten zu überprüfen ob alle drei Eigenschaften verschieden sind, wenn ja dann #t.
(define(prüfeVerschiedenheit xs)
  (eq? #f (check-duplicates xs)))

;Hilfsfunktion um in den Unterlisten zu überprüfen ob alle drei Eigenschaften gleich sind, wenn ja dann #t.
(define(prüfeGleichheit xs)
  (eq? 1 (length(remove-duplicates xs ))))

;Hilfsfunktion um beide Kriterien für ein Set für die Karten gilt.
(define(prüfe xs)
  (list(prüfeGleichheit xs)(prüfeVerschiedenheit xs)))

;Da keine true? vorhanden, gehen wir über false?.
(define (countFalse xs)
  (count false? xs))

;Hauptfunktion zur Überprüfung der Set-Eigenschaften
;Übergabe der Parameter als Liste mit den drei Karten als Unterlisten
;(Wir überprüfen für jede der zusammengesetzten Listen der Eigenschaften ob sie Gleich oder komplett verschieden sind
;und "speichern" sie in einer eigenen Liste mit #t oder #f.
;Dann zählen wir die false der Eigenschaften in der Liste, ist nur einmal eine 2 dabei, bedeutet dies, dass eine Eigenschaft
;die Set-Bedingung nicht erfüllt, daher löschen wir die 0 und 1 um anschließend zu prüfen ob die Liste noch eine zwei enthält.)
(define (is-a-set? karten)
  (empty? (remove* '(0 1)(map countFalse(map prüfe (eigenschaftenListe(first karten)(second karten)(third karten)))))))


;(is-a-set? '((2 red rectangle outline)(2 green rectangle outline)(1 green rectangle solid)))

;(is-a-set? '((2 red oval hatched)(2 red rectangle hatched)(2 red wave hatched)))


;Aufgabe 3.4

;Mische Deck
(define (mischeDeck)
  (shuffle erstelleDeck))

;Nehme die letzten 12 Karten
(define zwölf(list-tail(mischeDeck) 69))

;Zeige die Karten auf der Konsole
(define(playTime)
  (map erstelleKarte zwölf))
