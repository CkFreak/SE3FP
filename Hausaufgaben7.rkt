#lang racket

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

(define (produktHigh n f)
  (map ((curry *) f) n))
