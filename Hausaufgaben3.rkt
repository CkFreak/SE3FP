#lang racket
;Einbinden der SE3-Bib mit dem Flaggen Modul 
(require se3-bib/flaggen-module)

#|Aufgabe 1 Die internationale Buchstabiertafel|#
;;1.1 Entwurf einer Datenstruktur für die Buchstabiertafel.
;; Die Idee, ist, jeden Buchstaben als Char abzuspeichern, und ihn in einem Pair
;; mit dem dazugehörigen Buchstabierschlüssel zu assoziieren.
;; Die Buchstaben sind in der richtigen Reihenfolge von A-Z gefolgt von den Zahlen
;; 0-9 wiederum gefolgt von , und .
(define Buchstabiertafel
  '( (#\A "Alfa")
     (#\B "Bravo")
     (#\C "Charlie")
     (#\D "Delta")
     (#\E "Echo")
     (#\F "Foxtrott")
     (#\G "Golf")
     (#\H "Hotel")
     (#\I "India")
     (#\J "Juliett")
     (#\K "Kilo")
     (#\L "Lima")
     (#\M "Mike")
     (#\N "November")
     (#\O "Oscar")
     (#\P "Papa")
     (#\Q "Quebec")
     (#\R "Romeo")
     (#\S "Sierra")
     (#\T "Tango")
     (#\U "Uniform")
     (#\V "Viktor")
     (#\W "Whiskey")
     (#\X "X-ray")
     (#\Y "Yankee")
     (#\Z "Zulu")
     (#\0 "Nadazero")
     (#\1 "Unaone")
     (#\2 "Bissotwo")
     (#\3 "Terrathree")
     (#\4 "Kartefour")
     (#\5 "Pantafive")
     (#\6 "Soxisix")
     (#\7 "Setteseven")
     (#\8 "Oktoeight")
     (#\9 "Novenine")
     (#\, "Decimal")
     (#\. "Stop")
     (#\space "Space")))
;;Aufgabe 1.2
;;Bildet einen Char auf seinen Buchstabierschlüssel ab
;;Akzeptiert nur Großbuchstaben
(define (CharToKey buchstabe)
  (
   cadr (assoc buchstabe Buchstabiertafel)
  )
)


;;1.3 Von lower case zu upper case konvertieren
;;Alle Eingaben, die kein Char sind werden abgefangen und alle Eingaben die capital Chars sind
;;werden so belassen wie sie sind und ausgegeben
(define (char->key buchstabe)
  ( CharToKey 
    ( if
      (char? buchstabe)
      (       
        if (char-lower-case? buchstabe) 
        
        (char-upcase buchstabe)
        
        buchstabe
      )     
      buchstabe
    )
  )
)

;A1.4

; Wandelt einen String in eine Liste von der Schlüssel
(define (Wort->KeyList string)
  (
    charlist->KeyList (string->list string)
  )
)
; Wir erhalten eine Liste der Zeichen des Wortes
; Ist das Wort leer geben wir eine leere Liste wieder
; Ansonsten erstellen wir eine neue Liste und Wandeln das erste Zeichen
; In den Schlüssel um und rufen dann den Rest der Zeichenliste rekursiv auf
; also ohne das vorherige erste Element. 
(define (charlist->KeyList charlist)
  (
   if (empty? charlist)    
    '()
     ( 
      cons
      (char->key
      (car charlist)
      )      
      (charlist->KeyList (cdr charlist))
    )
  )
)
