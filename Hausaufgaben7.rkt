#lang racket

;;Errechnet das Produkt allgemein Rekursiv
(define (produkt n f)
  (if (null? n)
     '()
      (cons (* (car n) f) (produkt (cdr n) f))))