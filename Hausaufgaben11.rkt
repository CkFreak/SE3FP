#lang racket

(require se3-bib/prolog/prologInScheme)

#| Aufgabe 1 |#

#| 1.1:
(a) Unifiziert nicht, da Raichu bzw. Pikatchu nicht aneinander gebunden werden können.
(b) Unifiziert. ?typ wird an Pflanze gebunden und ?name an Bisasam.
(c) Unifiziert. ?typ wird an Normal gebunden, ?name an Mauzi.
(d) Unifiziert nicht. ?name kann nicht an Mauzi und Shiggy gebunden werden.
(e) ? Sollte wegen der anonymen Variable eig. unifizieren. Funktioniert aber praktisch leider nicht...
(f) Unifiziert. An ?name wird Ash gebunden, an ?typ wird Kampf gebunden und ?name wird
 an ?name2 gebunden (unifiziert also auch als Ash).
(g) Unifiziert. ?eltern ist durch den . gekennzeichnet als der Tail einer Liste, in der
also alles stehen könnte, auch Pikatchu Ditto.
|#

(<-(pokemon Elektron Pikatchu))
(<-(pokemon Elektro Raichu))

; 1.2:

(<-(ausleihe "K_110" 100))
(<-(ausleihe "P_30" 102))
(<-(ausleihe "P_32" 104))
(<-(ausleihe "P 50" 104))

(<-(vorbestellung "K 110" 104))
(<-(vorbestellung "K 110" 102))
(<-(vorbestellung "P 30" 100))
(<-(vorbestellung "P 30" 104))

(<-(leser Neugierig Nena 100 1989))
(<-(leser Linux Leo 102 1990))
(<-(leser Luator Eva 104 1988))

#|
1: (?-(vorbestellung "P 30" ?))
2: (?-(leser Luator Eva ? ?GebJahr))
   ?GebJahr = 1988
3: (?-(leser ?nach ?vor ?lnr ?) (ausleihe "P 50" ?lnr))
   ?nach = Luator
   ?vor = Eva
   ?lnr = 104
4: (?- (leser ?nach ?vor ?ls ?gebJahr)
   (vorbestellung ? ?ls)
   (test (< ?gebJahr (- 2017 60))))
   No.
5: (
|#