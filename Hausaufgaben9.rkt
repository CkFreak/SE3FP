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
