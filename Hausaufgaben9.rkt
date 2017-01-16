#lang swindle
(require swindle/setf
         swindle/misc)
#|Aufgabe 1.1 Definition von Klassen|#

;;Literatur allgemein
(defclass* Literatur ()
  (autoren
   :reader autoren
   :initarg :aut
   :type <list>)
  (jahr
   :reader jahr
   :initarg :jr
   :type <string>)
  (titel
   :reader titel
   :initarg :tl
   :type <string>)
  (schluessel
   :initarg :schluesse
   :reader schluessel
   :type <string>
   )
  :printer #t)

;;Buch Literatur 
(defclass* Buch (Literatur)
  (verlag
   :reader verlag
   :initarg :verl
   :type <string>)
  
  (verlagsort
   :reader ort
   :initarg :ort
   :type <string>)
  
  
  (reihe
   :reader reihe
   :initarg :rh
   :type <string>)
  
  
  (serienummer
   :reader seriennr
   :initarg :snr
   :type <string>)
  :printer #t)

;;Sammelband Literatur
(defclass* Sammelband (Buch)
  (nameHerausgeber
   :reader nameHerausgeb
   :initarg :nmeHerausg
   :type <string>)
  
  (seitenangaben
   :reader seitenang
   :initarg :seiten
   :type <string>)
  :printer #t)

;;Zeitschriftenartikel Literatur
(defclass* Zeitschriftenartikel (Literatur)
  (nameZeitschrift
   :reader nameZeitsch
   :initarg :nmeZeitschr
   :type <string>)
  
  (nummerBand
   :reader nummerB
   :initarg :nmrBa
   :type <string>)
  
  (nummerHeft
   :reader nummerHe
   :initarg :nmrHeft
   :type <string>)
  
  (erscheinungsmonat
   :reader erscheinungsmon
   :initarg :erschMon
   :type <string>)
  :printer #t)

;;Nessies Autobiographie
(define Nessie (make Buch
                         :verl "Minority-Verlag"
                         :aut '("Nessi")
                         :jr "1790"
                         :tl "Mein Leben im Lochness: Verfolgung als Ungeheuer"
                         :id "Nessie1790"
                         :ort "Inverness"
                         :rh "Die Besondere Biographie"
                         :snr "2"))
;;Prefects Sammelband
(define Prefect (make Sammelband
                          :id "Prefect1979"
                          :verl "Galactic Press"
                          :aut '("Prefect, F.")
                          :rh "Travel in Style"
                          :jr "1979"
                          :snr "5"
                          :tl "Mostly harmless - some observations concerning the third planet of the solar sytem"
                          :ort "Vega-System, 3rd planet"
                          :seiten "500"
                          :nmeHerausg "Adams, D., editor, The Hitchhiker's Guide to the Galaxy"))
;;Wells Zeitschriftenartikel
(define Wells (make Zeitschriftenartikel
                        :id "Wells3200"
                        :aut '("Wells, H. G.")
                        :jr "3200"
                        :tl "Zeitmaschinen leicht gemacht"
                        :nmeZeitschr "Heimwerkerpraxis für Anfänger"
                        :nmrHeft "500"
                        :nmrBa "3"))


#|Aufgabe 1.2 Generische Funktionen und Methoden|#

;;defgeneric für cite
(defgeneric* cite ((li Literatur)))

;;Cite für Bücher
(defmethod cite ((li Buch))
  (string-append (car (autoren li))
                 "("(jahr li) "). "
                 (titel li) ", Band "
                 (seriennr li) " aus der Reihe "
                 (reihe li) ". "
                 (verlag li) ", "
                 (ort li)
                 ))

;;Cite für Sammelbänder
(defmethod cite ((li Sammelband))
  (string-append (car (autoren li))
                 " (" (jahr li) "). "
                 (titel li) ". In "
                 (nameHerausgeb li)
                 " volume " (seriennr li) " of \"" 
                 (reihe li) "\"."
                 (verlag li) ", "
                 (ort li) ", 1500 edition, p. " (seitenang li)))

;;Cite für Zeitschriftenartikel
(defmethod cite ((li Zeitschriftenartikel))
  (string-append (car (autoren li)) "(" (jahr li) "). "
                 (titel li) ". " (nameZeitsch li) ", "
                 (nummerHe li) "(" (nummerB li) ")."))

;;Ausgeben der Citations 
(cite Nessie)
(cite Prefect)
(cite Wells)

;;Aufgabe 1.3 Ergänzungsmethoden

#|
Ergänzungsmethoden sind Methoden, die in Unterklassen verwendet werden können, um das Verhalten einer geerbten Methode anzupassen.
Um das zu tun, wird eine gleichnamige Methode in der Unterklasse definiert inklusive einem :before :after oder :around.
Die Schlüsselwörter geben an, dass die neue Methode die alte nicht ersetzen soll, sondern vor oder nach der alten geerbten Methode ausgeführt werden soll.
Gegenüber dem Super call haben Ergänzungsmethoden den Vorteil, dass keine Initalisierungen vergessen oder unterdrückt werden können.

Im Kontext der gegebenen Aufgaben ließen sich Ergänzungsmethoden mit der cite Methode verwenden. Es wäre möglich eine Standart Ausgabe zu generieren für jeden der Literaturtypen und
diese dann mit einer :before :after oder :around Ergänzung zu verfollständigen.

Dafür müsste man die cite Methoden der Unterklassen mit dem :after Schlüsselwort erweitern und dafür sorgen, dass der String den man heraus bekommt bearbeitbar ist.
Dann könnte man den Anfang jedes Cites gleich haben und nur das anpassen, was sich bei den verschiedenen Typen unterscheidet.
|#

;Aufgabe 2.1
#|
;Fahrzeug 
(defclass fahrzeug()
   ( medium 
     :reader med
     :initarg :medium
     :initvalue ""
     :type <string>
   )
   :printer #t
   )

;Fahrzeuge auf verschiedenen Medien
(defclass landFahrzeug (fahrzeug)
   (medium :initvalue "Land")
   :printer #t
   )
(defclass strassenFahrzeug (landFahrzeug)
   (medium :initvalue "Straße")
   :printer #t
   )
(defclass schienenFahrzeug (landFahrzeug)
   (medium :initvalue "Schiene")
   :printer #t
   )

(defclass wasserFahrzeug (fahrzeug)
   (medium :initvalue "Wasser")
   :printer #t
   )
(defclass luftFahrzeug (fahrzeug)
   (medium :initvalue "Luft")
   :printer #t
   )

;Mehrzweckfahrzeuge
(defclass amphibienFahrzeug (wasserFahrzeug landFahrzeug))
(defclass amphibienFlugzeug (strassenFahrzeug wasserFahrzeug luftFahrzeug))
(defclass zweiWegeFahrzeug (strassenFahrzeug schienenFahrzeug))
(defclass zeitZug (schienenFahrzeug luftFahrzeug))
|#

;Aufgabe 2.2
(defclass fahrzeug ()
   (medium 
     :reader med
     :initarg :medium
     :initvalue ""
     :type <string>     
     )
   (maxkmh
     :reader maxk
     :initarg :maxkmh
     :initvalue 0
     :type <number>
     )
   (zuladung 
     :reader zul
     :initarg :zuladung
     :initvalue 0
     :type <number>
     )
   (verbrauch
     :reader ver
     :initarg :verbrauch
     :initvalue 0
     :type <number>
     )
   (passagiere
     :reader pas
     :initarg :passagiere
     :initvalue 0
     :type <number>
     )
   :printer #t
   )

;Fahrzeuge auf verschiedenen Medien
(defclass landFahrzeug (fahrzeug)
   (medium :initvalue "Land")
   :printer #t
   )
(defclass strassenFahrzeug (landFahrzeug)
   (medium :initvalue "Straße")
   :printer #t
   )
(defclass schienenFahrzeug (landFahrzeug)
   (medium :initvalue "Schiene")
   :printer #t
   )

(defclass wasserFahrzeug (fahrzeug)
   (medium :initvalue "Wasser")
   :printer #t
   )
(defclass luftFahrzeug (fahrzeug)
   (medium :initvalue "Luft")
   :printer #t
   )

;Mehrzweckfahrzeuge
(defclass amphibienFahrzeug (wasserFahrzeug landFahrzeug)
  :printer #t
  )
(defclass amphibienFlugzeug (strassenFahrzeug wasserFahrzeug luftFahrzeug)
  :printer #t
  )
(defclass zweiWegeFahrzeug (strassenFahrzeug schienenFahrzeug)
  :printer #t
  )
(defclass zeitZug (schienenFahrzeug luftFahrzeug)
  :printer #t
  )

;Generische Funktionen
(defgeneric getMedium ((fahr fahrzeug)) :combination generic-append-combination) ;Beim Medium wollen wir alle Medien aufgelistet haben.
(defgeneric getMaxkmh ((fahr fahrzeug)) :combination generic-max-combination) ;Höchstgeschwindigkeit des schnellsten Fahrzeugs.Alternativ kann man mit generic-min-combination die Höchstgeschwindigkeit des langsamsten Fahrzeugs bekommen.
(defgeneric getZuladung ((fahr fahrzeug)) :combination generic-max-combination) ;Höchste Ladung die wir mit einem Fahrzeug Transportieren können.(auch hier alternativ mit min die kleinste Zuladung von unseren Fahrzeugen)
(defgeneric getVerbrauch ((fahr fahrzeug)) :combination generic-min-combination);Sparmsamstes Fahrzeug
(defgeneric getPassagiere ((fahr fahrzeug)) :combination generic-+-combination) ;Insgesamte Anzahl der Passagiere die wir transportieren können.

;Aufgabe 2.3
;Die getPassagier Methode für alle Fahrzeuge
(defmethod getPassagiere ((landFhrzg landFahrzeug))
  (getPassagiere landFhrzg))
(defmethod getPassagiere ((strFhrzg strassenFahrzeug))
  (getPassagiere strFhrzg))
(defmethod getPassagiere ((schiFhrzg schienenFahrzeug))
  (getPassagiere schiFhrzg))
(defmethod getPassagiere ((wasFhrzg wasserFahrzeug))
  (getPassagiere wasFhrzg))
(defmethod getPassagiere ((luftFhrzg luftFahrzeug))
  (getPassagiere luftFhrzg))
(defmethod getPassagiere ((ampFhrzg amphibienFahrzeug))
  (getPassagiere ampFhrzg))
(defmethod getPassagiere ((ampFlgzg amphibienFlugzeug))
  (getPassagiere ampFlgzg))
(defmethod getPassagiere ((zweiFhrzg zweiWegeFahrzeug))
  (getPassagiere zweiFhrzg))
(defmethod getPassagiere ((zeitFhrzg zeitZug))
  (getPassagiere zeitFhrzg))

;Mehrzeckfahrzeuge
(define amphiFahrzeug (make amphibienFahrzeug :maxkmh 315 :zuladung 540 :verbrauch 9.9 :passagiere 5))
(define 2wegeFahrzeug (make zweiWegeFahrzeug :maxkmh 56 :zuladung 100 :verbrauch 5000 :passagiere 300))
(define amphiFlugzeug (make amphibienFlugzeug :maxkmh 945 :zuladung 5000 :verbrauch 1700 :passagiere 800))
(define zug (make zeitZug :maxkmh 1500 :zuladung 999 :verbrauch 200 :passagiere 1000))
