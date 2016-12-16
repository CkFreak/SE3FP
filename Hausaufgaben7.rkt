#lang racket
(require 2htdp/image)
(require 2htdp/universe)

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

;obenMitte, linksOben, rechtsOben, mitteMitte, linksUnten, rechtsUnten, mitteUnten
(define anzeigeCodes'((1 1 1 0 1 1 1) ;;0
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
;;Holt die definition der Zahl aus der anzeigeCodes Liste
(define (getNumberFromList number)
  (cond [(= number 0) (first anzeigeCodes)]
         [(= number 1) (second anzeigeCodes)]
         [(= number 2) (third anzeigeCodes)]
         [(= number 3) (fourth anzeigeCodes)]
         [(= number 4) (fifth anzeigeCodes)]
         [(= number 5) (sixth anzeigeCodes)]
         [(= number 6) (seventh anzeigeCodes)]
         [(= number 7) (eighth anzeigeCodes)]
         [(= number 8) (ninth anzeigeCodes)]
         [(= number 9) (tenth anzeigeCodes)]
          ))

;;Zeichnet ein Segment mit der eingegeben Zahl
(define (drawSegment number)
  (let ([xs (getNumberFromList number)])
    (drawSegmentHilf (list-ref xs 0) (list-ref xs 1) (list-ref xs 2) (list-ref xs 3) (list-ref xs 4) (list-ref xs 5) (list-ref xs 6))))
  
  
;;Zeichnet das Segment nach den Angaben in den Variablen.
;;Die Variablen entsprechen der selben reihenfoge wie in der Liste oben
(define (drawSegmentHilf a b c d e f g)
  (overlay/align/offset "left" "top"
                        (drawHorizontalSegment b)
                        0
                        -12
  (overlay/align/offset "left" "bottom"
                        (drawHorizontalSegment e)
                        0
                        12
  (overlay/align/offset "right" "top"
                        (drawHorizontalSegment c)
                        0
                        -12
  (overlay/align/offset "right" "bottom"
                        (drawHorizontalSegment f)
                        0
                        12
  (overlay/align "middle" "bottom"
                 (drawVerticalSegment g)
  (overlay/align "middle" "top"
                 (drawVerticalSegment a)
  (overlay/align "middle" "middle"
               (drawVerticalSegment d)
               (rectangle 100 200 "solid" "black")))))))))

;;0 für grau 1 für Rot
(define (drawVerticalSegment color)
  (if (= color 1)
      (rectangle 80 10 "solid" "Red")
      (rectangle 80 10 "solid" "DimGray")))

;;0 für graun 1 für rot
(define (drawHorizontalSegment color)
  (if (= color 1)
      (rectangle 10 80 "solid" "Red")
      (rectangle 10 80 "solid" "DimGray")))

;;;Aufgabe 2.3

(define (zeige-7segment t)
  (let ([t (modulo t 280)]) 
  (cond [(= (floor (/ t 28)) 0) (drawSegment 0)]
        [(= (floor (/ t 28)) 1) (drawSegment 1)]
        [(= (floor (/ t 28)) 2) (drawSegment 2)]
        [(= (floor (/ t 28)) 3) (drawSegment 3)]
        [(= (floor (/ t 28)) 4) (drawSegment 4)]
        [(= (floor (/ t 28)) 5) (drawSegment 5)]
        [(= (floor (/ t 28)) 6) (drawSegment 6)]
        [(= (floor (/ t 28)) 7) (drawSegment 7)]
        [(= (floor (/ t 28)) 8) (drawSegment 8)]
        [(= (floor (/ t 28)) 9) (drawSegment 9)])))

;;Animiert die Sekundenanzeige
;(animate zeige-7segment)

;;Aufgabe 2.4

;;Zeichnet sechs nebeneinander liegende Segmente
;;Getrennt sind die Segemente nach jedem zweite um ein kleines bisschen mehr
(define (drawFullClock t)
  (overlay/align/offset "right" "middle" (drawSegment (modulo (quotient t 86400) 2)) ;;zehner Stunden Segment
                        535 0
  (overlay/align/offset "right" "middle" (drawSegment (modulo (quotient t 3600) 10)) ;;einzel Stunden Segment
                        425 0
  (overlay/align/offset "right" "middle" (drawSegment (modulo (quotient t 16800) 6)) ;; zehner Minunten Segment
                        320 0
  (overlay/align/offset "right" "middle" (drawSegment (modulo (quotient t 60) 10)) ;;einzel Minuten Segment
                        210 0
  (overlay/align/offset "right" "middle" (drawSegment (modulo (quotient t 10) 6)) ;;Zehner Sekunden Segment
                        105 0
                  (drawSegment (modulo t 10))))))));;einzel Sekunden Segment

;;Passt t an eine für drawFullClock verwendbare Form an
(define (zeige-dauer t)
  (let ([t (* (quotient t 28) 60)])
  (drawFullClock t)))

;;Animiert die gesammte Uhr
(animate zeige-dauer)