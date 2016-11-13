#lang racket
;Einbinden der SE3-Bib mit dem Flaggen Modul 
(require se3-bib/flaggen-module)

#|Aufgabe 1 Die internationale Buchstabiertafel|#
;;1.1 Entwurf einer Datenstruktur für die Buchstabiertafel.
;; Die Idee, ist, jeden Buchstaben als Char abzuspeichern, und ihn in einem Pair
;; mit dem dazugehörigen Buchstabierschlüssel zu assoziieren.
;; Die Buchstaben sind in der richtigen Reihenfolge von A-Z gefolgt von den Zahlen
;; 0-9 wiederum gefolgt von , und .
(define buchstabiertafel '('(#\A "Alfa")
                           '(#\B "Bravo")
                           '(#\C "Charlie")
                           '(#\D "Delta")
                           '(#\E "Echo")
                           '(#\F "Foxtrott")
                           '(#\G "Golf")
                           '(#\H "Hotel")
                           '(#\I "India")
                           '(#\J "Julliet")
                           '(#\K "Kilo")
                           '(#\L "Lima")
                           '(#\M "Mike")
                           '(#\N "November")
                           '(#\O "Oscar")
                           '(#\P "Papa")
                           '(#\Q "Quebec")
                           '(#\R "Romeo")
                           '(#\S "Sierra")
                           '(#\T "Tango")
                           '(#\U "Uniform")
                           '(#\V "Viktor")
                           '(#\W "Whiskey")
                           '(#\X "X-Ray")
                           '(#\Y "Yankee")
                           '(#\Z "Zulu")
                           '(#\0 "Nadazero")
                           '(#\1 "Unaone")
                           '(#\2 "Bissotwo")
                           '(#\3 "Terrathree")
                           '(#\4 "Kartefour")
                           '(#\5 "Pantafive")
                           '(#\6 "Soxsix")
                           '(#\7 "Setteseven")
                           '(#\8 "Oktoeight")
                           '(#\9 "Novenine")
                           '(#\, "Decimal")
                           '(#\. "Stop")))
  