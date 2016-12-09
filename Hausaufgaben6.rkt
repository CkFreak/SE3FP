#lang racket
#|Hausaufgaben Blatt 06|#
(require 2htdp/image)

(define (generateTriangles baseSize)
  (if (< baseSize 3)
      '()
      (cons (triangle baseSize "solid" "green") (generateTriangles (- baseSize 1)))))
      