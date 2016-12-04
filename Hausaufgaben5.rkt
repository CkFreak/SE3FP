#lang racket
#| SE 3 FP Hausaufgaben Blatt 05, Blaesch, Ramburger, Ney |#
(require se3-bib/butterfly-module)
#|
Aufgabe 1.1
Funktionen: (generateFamily flügelformMutter flügelFormVater fühlerFormMutter füherformVater farbeMutter farbeVater musterMutter musterVater anzahlKinder) -> Generiert die Kinder durch zugriff auf die
rezesiven und dominanten Merkmale der Schmetterlinge. Elternmerkmale werden eingelesen, mit rezesiven ergänzt und dann zufällig an die Kinder verteilt. Gibt auch eine Liste mit allen Merkmalen der
Kinder und Eltern aus. 

Hilfsfunktionen: (randomRezesiveMerkmale) Gibt für einen Schmetterling 4 neue rezesive Merkmale aus den Tabellen wieder.
                 (merkmalsVergleichMitListe merkmal) Das Merkmal wird in der Liste gesucht und eine Liste mit dem Merkmal und dem Rest wird ausgegeben als rezesives Random element

Tabellen: Musterung: Hält alle möglichen Muster vom dominantesten bis zum rezesivsten
          Flügelfarbe: Hält alle Flügelfarben von dominant nach rezesiv
          Fühlerform: Hält alle Fühlerformen von dominant nach rezesiv
          Flügelform: Hält alle Flügelformen von dominant nach rezesiv
|#


(define fluegelFarbe '(green red blue yellow))

(define muster '(star dots stripes))

(define fuehlerForm '(straight curly curved))

(define fluegelForm '(rhomb ellipse hexagon))


(define alleMerkmale '((green red blue yellow) (star dots stripes) (straight curly curved)  (rhomb ellipse hexagon)))

;; Vergleicht zwei merkmalslisten von Schmetterlingen mit der großen alleMerkmale liste und gibt dann einen einzelnen Schmetterlingsmerkmalsbaum aus
(define (dominanzTestListe erstesMerkmal zweitesMerkmal merkmalsliste)
(if (and (empty? erstesMerkmal) (empty? zweitesMerkmal))
         '()
         (if (member (car zweitesMerkmal) (member (car erstesMerkmal) (car merkmalsliste)))
             (cons (car zweitesMerkmal) (dominanzTestListe (cdr erstesMerkmal) (cdr zweitesMerkmal) (cdr merkmalsliste)))
             (cons (car erstesMerkmal) (dominanzTestListe (cdr erstesMerkmal) (cdr zweitesMerkmal) (cdr merkmalsliste)))
         )))

;;Diese Funktion generiert die Kinder am ende. Sie braucht als eingabe alle Dominanten und Rezesiven merkmale der Eltern und die anzhal der Kinder 
;;M steht für Mutter V steht für Vater R steht für Rezesiv und D für Dominant
(define (produceKids fluegelMD musterMD fuehlerMD formMD fluegelMR musterMR fuehlerMR formMR fluegelVD musterVD fuehlerVD formVD fluegelVR musterVR fuehlerVR formVR anzahlKinder)
      (zeichneSchmetterlinge (dominanzTestListe (merkmalsShuffle (list fluegelMD musterMD fuehlerMD formMD) (list fluegelMR musterMR fuehlerMR formMR))
                                            (merkmalsShuffle (list fluegelVD musterVD fuehlerVD formVD) (list fluegelVR musterVR fuehlerVR formVR))
                                            alleMerkmale)))

;;Diese Funktion macht aus einer liste dominanter und einer liste rezesiver merkmale eine neue liste mit einer mischung aus beiden und gibt diese dann zurück
(define (merkmalsShuffle merkmalslisteDominant merkmalslisteRezesiv)
(if (and (empty? merkmalslisteDominant) (empty? merkmalslisteRezesiv))
    '()
    (cons (car (shuffle (list  (car merkmalslisteDominant) (car merkmalslisteRezesiv)))) (merkmalsShuffle (cdr merkmalslisteDominant) (cdr merkmalslisteRezesiv)))))
    
(define (zeichneSchmetterlinge listeSchmetterlingsmerkmale)
  (display (map (lambda (butterfly) (apply show-butterfly butterfly))
                (append '() listeSchmetterlingsmerkmale))))

(define (butterflyRekursiv anzahlKinder vaterR vaterD mutterR mutterD)
  (letrec ( [inner (lambda (i kinderliste)
                     (if (= i 0)
                         (zeichneSchmetterlinge kinderliste)
                          (inner (- i 1) (append kinderliste (list ((merkmalsShuffle vaterD vaterR) (merkmalsShuffle mutterD mutterR)))))))])
     (inner anzahlKinder '())))