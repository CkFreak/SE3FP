#lang racket
#|Aufgabe 1 Produktberechnung mit drei verschienenen Methoden|#
;;Errechnet das Produkt allgemein Rekursiv
(define (produkt n f)
  (if (null? n)
     '()
      (cons (* (car n) f) (produkt (cdr n) f))))

;;Errechnet das Produkt endrekursiv
;;el ist eine emptyList
(define (produktEndRekursiv n f el)
  (if (null? n)
      (reverse el)
      (produktEndRekursiv (cdr n) f (cons (* (car n) f) el))))

;;Errechnet das Produkt mit Hilfe von Funktionen Höherer Ordnung
(define (produktHigh n f)
  (map ((curry *) f) n))

#|Aufgabe 2 Die Sieben-Segment Anzeige|#

;;2.1 Kodierung der 7-Segment Anzeige Zustände
;;Eine 0 steht für inanktiv und eine 1 für aktiv
;; der oberere Querbalken ist position 0 und der untere querbalken position 6
;;es wird von links nach rechts durchnummeriert

(define anzeigeCodes'((0 0 0 0 0 0 0) ;;0
                       (0 0 1 0 0 1 0) ;;1
                       (1 0 1 1 1 0 1) ;;2
                       (1 0 1 1 0 1 1) ;;3
                       (0 1 1 1 0 1 0) ;;4
                       (1 1 0 1 0 1 1) ;;5
                       (1 1 0 1 1 1 1) ;;6
                       (1 0 1 0 0 1 0) ;;7
                       (1 1 1 1 1 1 1) ;;8
                       (1 1 1 1 0 1 1) ;;9
                       ))