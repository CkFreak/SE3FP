#lang racket
;Einbinden der SE3-Bib mit dem Flaggen Modul 
(require se3-bib/flaggen-module)

#|Aufgabe 1 Die internationale Buchstabiertafel|#
;;1.1 Entwurf einer Datenstruktur für die Buchstabiertafel.
;; Die Idee, ist, jeden Buchstaben als Char abzuspeichern, und ihn in einem Pair
;; mit dem dazugehörigen Buchstabierschlüssel zu assoziieren.
;; Die Buchstaben sind in der richtigen Reihenfolge von A-Z gefolgt von den Zahlen
;; 0-9 wiederum gefolgt von , und .
(define buchstabiertafel '((list #\A "Alfa")
                           (list #\B "Bravo")
                           (list #\C "Charlie")
                           (list #\D "Delta")
                           (list #\E  "Echo")
                           (list #\F "Foxtrott")
                           (list #\G "Golf")
                           (list #\H "Hotel")
                           (list #\I "India")
                           (list #\J "Julliet")
                           (list #\K "Kilo")
                           (list #\L "Lima")
                           (list #\M "Mike")
                           (list #\N "November")
                           (list #\O "Oscar")
                           (list #\P "Papa")
                           (list #\Q "Quebec")
                           (list #\R "Romeo")
                           (list #\S "Sierra")
                           (list #\T "Tango")
                           (list #\U "Uniform")
                           (list #\V "Viktor")
                           (list #\W "Whiskey")
                           (list #\X "X-Ray")
                           (list #\Y "Yankee")
                           (list #\Z "Zulu")
                           (list #\0 "Nadazero")
                           (list #\1 "Unaone")
                           (list #\2 "Bissotwo")
                           (list #\3 "Terrathree")
                           (list #\4 "Kartefour")
                           (list #\5 "Pantafive")
                           (list #\6 "Soxsix")
                           (list #\7 "Setteseven")
                           (list #\8 "Oktoeight")
                           (list #\9 "Novenine")
                           (list #\, "Decimal")
                           (list #\. "Stop")))

;;Aufgabe 1.2
;;Bildet einen Char auf seinen Buchstabierschlüssel ab
;;Akzeptiert nur Großbuchstaben
(define (char->schluessel char)
  (for-each (lambda (letter)
              (if (equal? (second letter) char)
                  (display (third letter))
                  (display "")))
            '((list #\A "Alfa")
              (list #\B "Bravo")
              (list #\C "Charlie")
              (list #\D "Delta")
              (list #\E "Echo")
              (list #\F "Foxtrott")
              (list #\G "Golf")
              (list #\H "Hotel")
              (list #\I "India")
              (list #\J "Julliet")
              (list #\K "Kilo")
              (list #\L "Lima")
              (list #\M "Mike")
              (list #\N "November")
              (list #\O "Oscar")
              (list #\P "Papa")
              (list #\Q "Quebec")
              (list #\R "Romeo")
              (list #\S "Sierra")
              (list #\T "Tango")
              (list #\U "Uniform")
              (list #\V "Viktor")
              (list #\W "Whiskey")
              (list #\X "X-Ray")
              (list #\Y "Yankee")
              (list #\Z "Zulu")
              (list #\0 "Nadazero")
              (list #\1 "Unaone")
              (list #\2 "Bissotwo")
              (list #\3 "Terrathree")
              (list #\4 "Kartefour")
              (list #\5 "Pantafive")
              (list #\6 "Soxsix")
              (list #\7 "Setteseven")
              (list #\8 "Oktoeight")
              (list #\9 "Novenine")
              (list #\, "Decimal")
              (list #\. "Stop")) 
            ))

;;1.3 Von lower case zu upper case konvertieren
;;Alle Eingaben, die kein Char sind werden abgefangen und alle Eingaben die capital Chars sind
;;werden so belassen wie sie sind und ausgegeben
(define (lowerCase->upperCase char)
  (if (char? char)
      ;sollte es ein char sein...
      (if (char-lower-case? char)
          ;und lowerCase, dann gib ihn als upperCase aus
          (char-upcase char)
          ;sonst einfach den char
          (display char))
      ;wenn es kein char ist, teile das mit
      (display "This is not a Char!")))

;;Aufgabe 1.4
;;Nimmt ein ganzes Wort und assoziiert jeden Buchstaben mit seinem Buchstabierschlüssel
(define (string->buchstabierschluessel wort)
  (let ([wortAlsChars (string->list wort)]) wortAlsChars))
  
;A1.1)
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
     (0 "Nadazero")
     (1 "Unaone")
     (2 "Bissotwo")
     (3 "Terrathree")
     (4 "Kartefour")
     (5 "Pantafive")
     (6 "Soxisix")
     (7 "Setteseven")
     (8 "Oktoeight")
     (9 "Novenine")
     (#\, "Decimal")
     (#\. "Stop")))

;A1.2

(define (CharToKey buchstabe)
  (
   cadr (assoc buchstabe Buchstabiertafel)
  )
)

;A1.3
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

;;Aufgabe 1.4
;;Nimmt ein ganzes Wort und assoziiert jeden Buchstaben mit seinem Buchstabierschlüssel
(define (string->buchstabierschluessel wort emptyString)
  (if (not (null? wort))
      (let ([wortAlsChars (string->list wort)])
        (let ([ausgabe (string-append emptyString)])
        (string-append(CharToKey (first wortAlsChars)))
        (string->buchstabierschluessel (substring wort 1) ausgabe)
        
        ))
      (emptyString)))
