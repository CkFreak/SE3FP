#lang racket
#|Hausaufgaben Blatt 06|#
(require 2htdp/image)

#|Aufgabe 2 Nikolausaufgabe|#

;;Generiert eine Liste aus Dreiecken, die mit jedem Dreieck um 1 in der Länge reduziert werden.
(define (generateTriangles baseSize)
  (if (< baseSize 10)
      '()
      (cons (triangle baseSize "solid" "green") (generateTriangles (- baseSize 5)))))

;;Malt abhängig von der baseSize einen Baum
(define (drawTree baseSize)
  (let ([treeList (generateTriangles baseSize)])
    (drawTreeHelp (cdr treeList) (car treeList))))

(define (drawTreeHelp triangles image)
  (if (null? triangles)
      image
      (drawTreeHelp (cdr triangles) (underlay/offset image 0 -35 (car triangles)))))



;Schneeflocken!!!
(define (generateSnowflakes size amount)
  (if (= amount 1)  
  '()
  (cons (radial-star 8 8 size "solid" "gray") (generateSnowflakes size (- amount 1)))))
      