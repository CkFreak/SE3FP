#lang racket
#|Hausaufgaben Blatt 06|#
(require 2htdp/image)

;;Generiert eine Liste aus Dreiecken, die mit jedem Dreieck um 1 in der Länge reduziert werden.
(define (generateTriangles baseSize)
  (if (< baseSize 10)
      '()
      (cons (triangle baseSize "solid" "green") (generateTriangles (- baseSize 5)))))


(define (drawTree triangleList)
  (if (= (length triangleList) 2)
      (overlay/offset (car triangleList) 0 10 (cadr triangleList))
      (overlay/offset (car triangleList) 0 10 (drawTree (cdr triangleList)))))
      