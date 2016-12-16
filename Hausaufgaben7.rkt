#lang racket
(require 2htdp/image)

#|Aufgabe 1 Produktberechnung mit drei verschienenen Methoden|#
;;Errechnet das Produkt allgemein Rekursiv
(define (produkt n f)
  (if (null? n)
     '()
      (cons (* (car n) f) (produkt (cdr n) f))))

(define (produktEndRekursiv n f)
  ((produktEndRekursiv n f '())))

;;Errechnet das Produkt endrekursiv
;;el ist eine emptyList
(define (produktEndRekursivHilf n f el)
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

(define (drawSegment)
  (overlay/align/offset "left" "top"
                        (drawHorizontalSegment 0)
                        0
                        -12
  (overlay/align/offset "left" "bottom"
                        (drawHorizontalSegment 0)
                        0
                        12
  (overlay/align/offset "right" "top"
                        (drawHorizontalSegment 1)
                        0
                        -12
  (overlay/align/offset "right" "bottom"
                        (drawHorizontalSegment 1)
                        0
                        12
  (overlay/align "middle" "bottom"
                 (drawVerticalSegment 1)
  (overlay/align "middle" "top"
                 (drawVerticalSegment 1)
  (overlay/align "middle" "middle"
               (drawVerticalSegment 1)
               (rectangle 100 200 "solid" "black")))))))))

;;0 für grau 1 für Rot
(define (drawVerticalSegment color)
  (if (= color 1)
      (rectangle 80 10 "solid" "Red")
      (rectangle 80 10 "solid" "DimGray")))

;;
(define (drawHorizontalSegment color)
  (if (= color 1)
      (rectangle 10 80 "solid" "Red")
      (rectangle 10 80 "solid" "DimGray")))