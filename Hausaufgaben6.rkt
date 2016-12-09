#lang racket
#|Hausaufgaben Blatt 06|#
(require 2htdp/image)

#|Aufgabe 2 Nikolausaufgabe|#

;;Generiert eine Liste aus Dreiecken, die mit jedem Dreieck um 1 in der Länge reduziert werden.
(define (generateTriangles baseSize)
  (if (< baseSize 10)
      '()
      (cons (triangle baseSize "solid" "green") (generateTriangles (- baseSize 5)))))

;;Malt aus einer Liste an Dreiecken einen Tannenbaum
(define (drawTree triangleList)
  (if (= (length triangleList) 1)
      (overlay/offset (car triangleList) 0 10 (rectangle 10 5 "solid" "brown"))
      (overlay/offset (car triangleList) 0 35 (drawTree (cdr triangleList)))))


;;Nur ein Test
(drawTree (reverse(generateTriangles 100)))
      